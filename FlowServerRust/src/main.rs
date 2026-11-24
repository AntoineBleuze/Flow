mod elevators;
mod itinerary;

#[global_allocator]
static GLOBAL: mimalloc::MiMalloc = mimalloc::MiMalloc;

use axum::{
    body::Bytes,
    extract::{
        ws::{Message, WebSocket, WebSocketUpgrade},
        Path as AxumPath, Query, State,
    },
    http::{header, StatusCode},
    response::IntoResponse,
    routing::get,
    Json, Router,
};
use chrono::{Duration as ChronoDuration, Utc};
use chrono_tz::Europe::Paris;
use elevators::{
    get_distance_meters, load_elevators_from_disk, normalize_string, parse_elevators_csv,
    ElevatorsDb,
};
use futures_util::{future::join_all, SinkExt, StreamExt};
use itinerary::enrich_itinerary;
use reqwest::Client;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use std::{
    collections::{HashMap, HashSet, VecDeque},
    path::PathBuf,
    sync::{
        atomic::{AtomicBool, AtomicUsize, Ordering},
        Arc,
    },
    time::{Duration, SystemTime, UNIX_EPOCH},
};
use tokio::sync::{broadcast, mpsc, Mutex, Notify, RwLock, Semaphore};
use tower_http::cors::CorsLayer;

const NAVITIA_BASE: &str = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia";
const TRAFFIC_REFRESH_INTERVAL_SECS: u64 = 30;
const ACTIVE_REFRESH_INTERVAL_SECS: u64 = 20;
const GLOBAL_RAIL_INTERVAL_SECS: u64 = 30;
const ELEVATORS_REFRESH_INTERVAL_SECS: u64 = 8 * 60 * 60;
const CACHE_SAVE_INTERVAL_SECS: u64 = 10 * 60;
const MAX_CONCURRENT_REQUESTS: usize = 6;
const MAX_LOG_LINES: usize = 1000;

fn now_ms() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_millis() as u64
}

fn paris_time_str() -> String {
    Utc::now()
        .with_timezone(&Paris)
        .format("%H:%M:%S")
        .to_string()
}

#[derive(Clone, Serialize, Deserialize)]
struct DepartureCacheEntry {
    data: Vec<Arc<Value>>,
    timestamp: u64,
    source: String,
}

#[derive(Default)]
struct TrafficCache {
    disruptions: Vec<Arc<Value>>,
    serialized_rest: Option<Bytes>,
    serialized_push: Option<String>,
    timestamp: u64,
    last_full_update: Option<String>,
}

struct AppState {
    http: Client,
    api_key: String,
    navitia_sem: Arc<Semaphore>,
    traffic: RwLock<TrafficCache>,
    is_refreshing_traffic: AtomicBool,
    departures: RwLock<HashMap<String, DepartureCacheEntry>>,
    in_flight_stops: Mutex<HashMap<String, Arc<Notify>>>,
    active_stop_counts: Mutex<HashMap<String, usize>>,
    elevators: RwLock<ElevatorsDb>,
    traffic_tx: broadcast::Sender<String>,
    stop_update_tx: broadcast::Sender<String>,
    connected_clients: AtomicUsize,
    logs: Mutex<VecDeque<String>>,
    cache_file: PathBuf,
    elevators_cache_file: PathBuf,
}

impl AppState {
    async fn log(&self, level: &str, msg: &str) {
        let line = format!("[{}] [{}] {}", paris_time_str(), level, msg);
        println!("{}", line);
        let mut logs = self.logs.lock().await;
        if logs.len() >= MAX_LOG_LINES {
            logs.pop_front();
        }
        logs.push_back(line);
    }
}

// ============================================================
// Navitia Client avec Semaphore + Backoff exponentiel 429
// ============================================================
async fn navitia_fetch_typed<T: serde::de::DeserializeOwned>(
    state: &Arc<AppState>,
    url: &str,
) -> Result<T, String> {
    let mut retries = 0u32;
    loop {
        let permit = state
            .navitia_sem
            .acquire()
            .await
            .map_err(|e| e.to_string())?;

        let res = state
            .http
            .get(url)
            .header("apiKey", &state.api_key)
            .timeout(Duration::from_secs(10))
            .send()
            .await;

        drop(permit);

        match res {
            Ok(resp) => {
                let status = resp.status();
                if status == reqwest::StatusCode::TOO_MANY_REQUESTS && retries < 3 {
                    let delay_ms = 2000 * 2u64.pow(retries);
                    state
                        .log(
                            "WARN",
                            &format!(
                                "⚠️ 429 détecté (essai {}/3), retry dans {}ms...",
                                retries + 1,
                                delay_ms
                            ),
                        )
                        .await;
                    retries += 1;
                    tokio::time::sleep(Duration::from_millis(delay_ms)).await;
                    continue;
                }
                if !status.is_success() {
                    let text = resp.text().await.unwrap_or_default();
                    return Err(format!("Navitia {}: {}", status.as_u16(), text));
                }
                return resp.json::<T>().await.map_err(|e| e.to_string());
            }
            Err(e) => return Err(e.to_string()),
        }
    }
}

async fn navitia_fetch(state: &Arc<AppState>, url: &str) -> Result<Value, String> {
    navitia_fetch_typed::<Value>(state, url).await
}

async fn fetch_all_pages(
    state: &Arc<AppState>,
    initial_url: &str,
    max_pages: usize,
) -> Result<Vec<Value>, String> {
    let mut url = Some(initial_url.to_string());
    let mut all_disruptions = Vec::new();
    let mut page = 0usize;

    while let Some(current_url) = url {
        if page >= max_pages {
            break;
        }
        let data = navitia_fetch(state, &current_url).await?;
        if let Some(arr) = data.get("disruptions").and_then(|v| v.as_array()) {
            all_disruptions.extend(arr.iter().cloned());
        }
        url = data
            .get("links")
            .and_then(|v| v.as_array())
            .and_then(|links| {
                links.iter().find_map(|l| {
                    (l.get("rel").and_then(|r| r.as_str()) == Some("next"))
                        .then(|| l.get("href").and_then(|h| h.as_str()).map(|s| s.to_string()))
                        .flatten()
                })
            });
        page += 1;
    }

    Ok(all_disruptions)
}

fn slim_disruptions(disruptions: &[Value]) -> Vec<Value> {
    disruptions
        .iter()
        .map(|d| {
            let severity = d.get("severity").filter(|v| !v.is_null()).map(|s| {
                json!({
                    "effect": s.get("effect").cloned().unwrap_or(Value::Null),
                    "color": s.get("color").cloned().unwrap_or(Value::Null),
                    "priority": s.get("priority").cloned().unwrap_or(Value::Null),
                    "name": s.get("name").cloned().unwrap_or(Value::Null),
                })
            });

            let messages = d.get("messages").and_then(|v| v.as_array()).map(|arr| {
                arr.iter()
                    .take(1)
                    .map(|m| {
                        let channel = m.get("channel").filter(|v| !v.is_null()).map(|c| {
                            json!({
                                "name": c.get("name").cloned().unwrap_or(Value::Null),
                                "content_type": c.get("content_type").cloned().unwrap_or(Value::Null),
                            })
                        });
                        json!({
                            "text": m.get("text").cloned().unwrap_or(Value::Null),
                            "channel": channel,
                        })
                    })
                    .collect::<Vec<_>>()
            });

            let impacted_objects = d
                .get("impacted_objects")
                .and_then(|v| v.as_array())
                .map(|arr| {
                    arr.iter()
                        .map(|obj| {
                            let pt_object =
                                obj.get("pt_object").filter(|v| !v.is_null()).map(|pt| {
                                    let line = pt.get("line").filter(|v| !v.is_null()).map(|l| {
                                        json!({
                                            "id": l.get("id").cloned().unwrap_or(Value::Null),
                                            "code": l.get("code").cloned().unwrap_or(Value::Null),
                                            "name": l.get("name").cloned().unwrap_or(Value::Null),
                                            "commercial_mode": l.get("commercial_mode").cloned().unwrap_or(Value::Null),
                                            "color": l.get("color").cloned().unwrap_or(Value::Null),
                                            "text_color": l.get("text_color").cloned().unwrap_or(Value::Null),
                                        })
                                    });
                                    json!({
                                        "id": pt.get("id").cloned().unwrap_or(Value::Null),
                                        "name": pt.get("name").cloned().unwrap_or(Value::Null),
                                        "line": line,
                                    })
                                });

                            let impacted_stops =
                                obj.get("impacted_stops").and_then(|v| v.as_array()).map(|stops| {
                                    stops
                                        .iter()
                                        .map(|s| {
                                            let sp = s
                                                .get("stop_point")
                                                .filter(|v| !v.is_null())
                                                .map(|p| {
                                                    json!({
                                                        "id": p.get("id").cloned().unwrap_or(Value::Null),
                                                        "name": p.get("name").cloned().unwrap_or(Value::Null),
                                                    })
                                                });
                                            json!({
                                                "stop_point": sp,
                                                "cause": s.get("cause").cloned().unwrap_or(Value::Null),
                                            })
                                        })
                                        .collect::<Vec<_>>()
                                });

                            let impacted_section =
                                obj.get("impacted_section").filter(|v| !v.is_null()).map(|sec| {
                                    json!({
                                        "from": sec.get("from").filter(|v| !v.is_null()).map(|f| json!({ "name": f.get("name").cloned().unwrap_or(Value::Null) })),
                                        "to": sec.get("to").filter(|v| !v.is_null()).map(|t| json!({ "name": t.get("name").cloned().unwrap_or(Value::Null) })),
                                    })
                                });

                            json!({
                                "pt_object": pt_object,
                                "impacted_stops": impacted_stops,
                                "impacted_section": impacted_section,
                            })
                        })
                        .collect::<Vec<_>>()
                });

            json!({
                "id": d.get("id").cloned().unwrap_or(Value::Null),
                "status": d.get("status").cloned().unwrap_or(Value::Null),
                "cause": d.get("cause").cloned().unwrap_or(Value::Null),
                "category": d.get("category").cloned().unwrap_or(Value::Null),
                "severity": severity,
                "messages": messages,
                "application_periods": d.get("application_periods").cloned().unwrap_or(Value::Null),
                "updated_at": d.get("updated_at").cloned().unwrap_or(Value::Null),
                "impacted_objects": impacted_objects,
            })
        })
        .collect()
}

// ============================================================
// Refresh Trafic
// ============================================================
async fn auto_refresh(state: Arc<AppState>) {
    if state
        .is_refreshing_traffic
        .compare_exchange(false, true, Ordering::SeqCst, Ordering::SeqCst)
        .is_err()
    {
        state
            .log("INFO", "⏳ Auto-refresh trafic déjà en cours, ignoré.")
            .await;
        return;
    }

    state
        .log("INFO", "🔄 Auto-refresh des perturbations trafic...")
        .await;

    let modes = [
        "physical_mode:Metro",
        "physical_mode:RapidTransit",
        "physical_mode:Tramway",
        "physical_mode:LocalTrain",
        "physical_mode:Bus",
    ];

    let since = (Utc::now() - ChronoDuration::hours(24))
        .with_timezone(&Paris)
        .format("%Y%m%dT%H%M%S")
        .to_string();

    let futures = modes.iter().map(|mode| {
        let state = Arc::clone(&state);
        let url = format!(
            "{}/line_reports/physical_modes/{}/line_reports?count=500&since={}",
            NAVITIA_BASE, mode, since
        );
        async move {
            match fetch_all_pages(&state, &url, 20).await {
                Ok(d) => d,
                Err(e) => {
                    state
                        .log("WARN", &format!("⚠️ Erreur sur {}: {}", mode, e))
                        .await;
                    Vec::new()
                }
            }
        }
    });

    let all_disruptions: Vec<Value> = join_all(futures).await.into_iter().flatten().collect();
    let count = all_disruptions.len();
    let slim = slim_disruptions(&all_disruptions);
    let now_iso = Utc::now().to_rfc3339();
    let full_bytes = Bytes::from(
        serde_json::to_vec(&json!({ "disruptions": &all_disruptions })).unwrap_or_default(),
    );
    let arc_disruptions: Vec<Arc<Value>> = all_disruptions.into_iter().map(Arc::new).collect();
    let push_payload = json!({
        "type": "traffic_update",
        "timestamp": now_iso,
        "data": { "disruptions": slim },
    })
    .to_string();

    {
        let mut tc = state.traffic.write().await;
        tc.disruptions = arc_disruptions;
        tc.serialized_rest = Some(full_bytes);
        tc.serialized_push = Some(push_payload.clone());
        tc.timestamp = now_ms();
        tc.last_full_update = Some(now_iso);
    }

    state
        .log("INFO", &format!("✅ {} perturbations récupérées", count))
        .await;

    let _ = state.traffic_tx.send(push_payload);
    state.is_refreshing_traffic.store(false, Ordering::SeqCst);
}

// ============================================================
// Cache départs + Typed Deserialization + Coalescing
// ============================================================
#[derive(Deserialize)]
struct NavitiaDeparturesResponse {
    #[serde(default)]
    departures: Vec<RawDeparture>,
}

#[derive(Deserialize)]
struct RawDeparture {
    display_informations: Option<RawDisplayInformations>,
    stop_date_time: Option<RawStopDateTime>,
    stop_point: Option<RawStopPoint>,
}

#[derive(Deserialize)]
struct RawDisplayInformations {
    direction: Option<String>,
    label: Option<String>,
    code: Option<String>,
    color: Option<String>,
    commercial_mode: Option<String>,
    network: Option<String>,
    text_color: Option<String>,
    name: Option<String>,
}

#[derive(Deserialize)]
struct RawStopDateTime {
    departure_date_time: Option<String>,
    stop_point: Option<RawStopPointRef>,
}

#[derive(Deserialize)]
struct RawStopPointRef {
    id: Option<String>,
    name: Option<String>,
}

#[derive(Deserialize)]
struct RawStopPoint {
    id: Option<String>,
    name: Option<String>,
    stop_area: Option<RawStopAreaRef>,
}

#[derive(Deserialize)]
struct RawStopAreaRef {
    id: Option<String>,
}

fn raw_to_slim_value(dep: RawDeparture) -> Value {
    let slim_di = dep
        .display_informations
        .map(|info| {
            json!({
                "direction": info.direction,
                "label": info.label,
                "code": info.code,
                "color": info.color,
                "commercial_mode": info.commercial_mode,
                "network": info.network,
                "text_color": info.text_color,
                "name": info.name,
            })
        })
        .unwrap_or(Value::Null);

    let slim_sdt = dep
        .stop_date_time
        .map(|s| {
            let mut obj = serde_json::Map::new();
            if let Some(dt) = s.departure_date_time {
                obj.insert("departure_date_time".to_string(), Value::String(dt));
            }
            if let Some(sp) = s.stop_point.filter(|p| p.id.is_some()) {
                obj.insert(
                    "stop_point".to_string(),
                    json!({
                        "id": sp.id,
                        "name": sp.name,
                    }),
                );
            }
            Value::Object(obj)
        })
        .unwrap_or(Value::Null);

    let mut root = serde_json::Map::new();
    root.insert("display_informations".to_string(), slim_di);
    root.insert("stop_date_time".to_string(), slim_sdt);

    if let Some(sp) = dep.stop_point {
        let mut sp_obj = serde_json::Map::new();
        if let Some(id) = sp.id {
            sp_obj.insert("id".to_string(), Value::String(id));
        }
        if let Some(name) = sp.name {
            sp_obj.insert("name".to_string(), Value::String(name));
        }
        if let Some(sa_id) = sp.stop_area.and_then(|sa| sa.id) {
            sp_obj.insert("stop_area".to_string(), json!({ "id": sa_id }));
        }
        root.insert("stop_point".to_string(), Value::Object(sp_obj));
    }

    Value::Object(root)
}

async fn update_cache(state: &Arc<AppState>, stop_id: &str, departures: Vec<Arc<Value>>) {
    let ts = now_ms();
    let mut updated_ids = vec![stop_id.to_string()];

    {
        let mut cache = state.departures.write().await;
        cache.insert(
            stop_id.to_string(),
            DepartureCacheEntry {
                data: departures.clone(),
                timestamp: ts,
                source: "on-demand".to_string(),
            },
        );

        if stop_id.starts_with("stop_area:") && !departures.is_empty() {
            let mut grouped: HashMap<String, Vec<Arc<Value>>> = HashMap::new();
            for dep in &departures {
                if let Some(sp_id) = dep.pointer("/stop_point/id").and_then(|v| v.as_str()) {
                    grouped
                        .entry(sp_id.to_string())
                        .or_default()
                        .push(Arc::clone(dep));
                }
            }
            for (sp_id, deps) in grouped {
                updated_ids.push(sp_id.clone());
                cache.insert(
                    sp_id,
                    DepartureCacheEntry {
                        data: deps,
                        timestamp: ts,
                        source: "on-demand".to_string(),
                    },
                );
            }
        }
    }

    for id in updated_ids {
        let _ = state.stop_update_tx.send(id);
    }
}

async fn refresh_stop(state: &Arc<AppState>, stop_id: &str) {
    if stop_id.contains("stop_area:") && stop_id.contains(":C") {
        return;
    }

    let (notify, is_leader) = {
        let mut in_flight = state.in_flight_stops.lock().await;
        if let Some(existing) = in_flight.get(stop_id) {
            (Arc::clone(existing), false)
        } else {
            let n = Arc::new(Notify::new());
            in_flight.insert(stop_id.to_string(), Arc::clone(&n));
            (n, true)
        }
    };

    if !is_leader {
        notify.notified().await;
        return;
    }

    let endpoint = if stop_id.contains("stop_point") {
        "stop_points"
    } else {
        "stop_areas"
    };
    let url = format!(
        "{}/{}/{}/departures?count=1000&disable_geojson=true",
        NAVITIA_BASE, endpoint, stop_id
    );

    match navitia_fetch_typed::<NavitiaDeparturesResponse>(state, &url).await {
        Ok(data) => {
            let arc_deps: Vec<Arc<Value>> = data
                .departures
                .into_iter()
                .map(|d| Arc::new(raw_to_slim_value(d)))
                .collect();
            update_cache(state, stop_id, arc_deps).await;
        }
        Err(err) => {
            let mut handled = false;
            if err.contains("404") || err.contains("unknown_object") {
                let retry_url = if !stop_id.contains("stop_point") {
                    let retry_id = if stop_id.starts_with("stop_point:") {
                        stop_id.to_string()
                    } else {
                        format!("stop_point:{}", stop_id)
                    };
                    Some(format!(
                        "{}/stop_points/{}/departures?count=1000&disable_geojson=true",
                        NAVITIA_BASE, retry_id
                    ))
                } else {
                    stop_id.strip_prefix("stop_point:").map(|raw| {
                        format!(
                            "{}/stop_areas/stop_area:{}/departures?count=1000&disable_geojson=true",
                            NAVITIA_BASE, raw
                        )
                    })
                };

                if let Some(r_url) = retry_url {
                    if let Ok(data) =
                        navitia_fetch_typed::<NavitiaDeparturesResponse>(state, &r_url).await
                    {
                        let arc_deps: Vec<Arc<Value>> = data
                            .departures
                            .into_iter()
                            .map(|d| Arc::new(raw_to_slim_value(d)))
                            .collect();
                        update_cache(state, stop_id, arc_deps).await;
                        handled = true;
                    }
                }
            }
            if !handled {
                update_cache(state, stop_id, Vec::new()).await;
            }
        }
    }

    {
        let mut in_flight = state.in_flight_stops.lock().await;
        in_flight.remove(stop_id);
    }
    notify.notify_waiters();
}

async fn ingest_global_departures(state: &Arc<AppState>, departures: Vec<RawDeparture>) {
    if departures.is_empty() {
        return;
    }

    let mut by_stop: HashMap<String, Vec<Arc<Value>>> = HashMap::new();
    let total = departures.len();

    for dep in departures {
        let arc_dep = Arc::new(raw_to_slim_value(dep));
        let sp_id = arc_dep
            .pointer("/stop_point/id")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());
        let sa_id = arc_dep
            .pointer("/stop_point/stop_area/id")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());

        if let Some(id) = sp_id {
            by_stop.entry(id).or_default().push(Arc::clone(&arc_dep));
        }
        if let Some(id) = sa_id {
            by_stop.entry(id).or_default().push(arc_dep);
        }
    }

    let now = now_ms();
    let mut updated_ids = Vec::new();

    {
        let mut cache = state.departures.write().await;
        for (stop_id, deps) in by_stop {
            if let Some(existing) = cache.get(&stop_id) {
                if existing.source == "on-demand" && now.saturating_sub(existing.timestamp) < 20_000 {
                    continue;
                }
            }
            cache.insert(
                stop_id.clone(),
                DepartureCacheEntry {
                    data: deps,
                    timestamp: now,
                    source: "global".to_string(),
                },
            );
            updated_ids.push(stop_id);
        }
    }

    state
        .log(
            "INFO",
            &format!(
                "💾 [Global Ingest] Mis à jour {} arrêt(s) ({} départs traités)",
                updated_ids.len(),
                total
            ),
        )
        .await;

    for id in updated_ids {
        let _ = state.stop_update_tx.send(id);
    }
}

async fn refresh_all_global_rail_departures(state: Arc<AppState>) {
    if state.navitia_sem.available_permits() == 0 {
        state
            .log(
                "WARN",
                "⚠️ [Global Rail] File occupée, skip de ce refresh global.",
            )
            .await;
        return;
    }

    let modes = [
        ("physical_mode:Metro", 1000),
        ("physical_mode:RapidTransit", 800),
        ("physical_mode:LocalTrain", 800),
        ("physical_mode:Tramway", 500),
    ];

    let futures = modes.iter().map(|(mode, count)| {
        let state = Arc::clone(&state);
        let url = format!(
            "{}/physical_modes/{}/departures?count={}&disable_geojson=true",
            NAVITIA_BASE, mode, count
        );
        async move {
            match navitia_fetch_typed::<NavitiaDeparturesResponse>(&state, &url).await {
                Ok(data) => {
                    ingest_global_departures(&state, data.departures).await;
                }
                Err(e) => {
                    state
                        .log("ERROR", &format!("❌ [Global Fetch Error] {}: {}", mode, e))
                        .await;
                }
            }
        }
    });

    join_all(futures).await;
}

async fn refresh_active_stops(state: Arc<AppState>) {
    let active_ids: Vec<String> = {
        let counts = state.active_stop_counts.lock().await;
        counts.keys().cloned().collect()
    };
    if active_ids.is_empty() {
        return;
    }

    let now = now_ms();
    let expired: Vec<String> = {
        let cache = state.departures.read().await;
        active_ids
            .into_iter()
            .filter(|id| match cache.get(id) {
                None => true,
                Some(c) => now.saturating_sub(c.timestamp) > 20_000 || c.source == "global",
            })
            .collect()
    };

    if expired.is_empty() {
        return;
    }

    let futures = expired.into_iter().map(|id| {
        let state = Arc::clone(&state);
        async move { refresh_stop(&state, &id).await }
    });
    join_all(futures).await;
}

// ============================================================
// Cache disque persistant (async + purge RAM)
// ============================================================
async fn load_persistent_cache(state: &Arc<AppState>) {
    match tokio::fs::read_to_string(&state.cache_file).await {
        Ok(content) => match serde_json::from_str::<HashMap<String, DepartureCacheEntry>>(&content) {
            Ok(parsed) => {
                let count = parsed.len();
                *state.departures.write().await = parsed;
                state
                    .log(
                        "INFO",
                        &format!("💾 [Persistent Cache] {} arrêts restaurés.", count),
                    )
                    .await;
            }
            Err(e) => {
                state
                    .log(
                        "ERROR",
                        &format!("❌ [Persistent Cache] Parse error: {}", e),
                    )
                    .await;
            }
        },
        Err(_) => {
            state
                .log(
                    "INFO",
                    "💾 [Persistent Cache] Aucun cache disque trouvé, démarrage à vide.",
                )
                .await;
        }
    }
}

async fn save_persistent_cache(state: &Arc<AppState>) {
    let now = now_ms();
    let max_global_age_ms = 3 * 60 * 1000;
    let max_ondemand_age_ms = 15 * 60 * 1000;
    let snapshot: HashMap<String, DepartureCacheEntry>;
    let purged: usize;

    {
        let mut cache = state.departures.write().await;
        let before = cache.len();
        cache.retain(|_, v| {
            let max_age = if v.source == "global" {
                max_global_age_ms
            } else {
                max_ondemand_age_ms
            };
            now.saturating_sub(v.timestamp) < max_age
        });
        purged = before.saturating_sub(cache.len());
        snapshot = cache.clone();
    }

    if let Ok(json_bytes) = serde_json::to_vec(&snapshot) {
        let tmp_file = state.cache_file.with_extension("json.tmp");
        match tokio::fs::write(&tmp_file, &json_bytes).await {
            Ok(_) => {
                if let Err(e) = tokio::fs::rename(&tmp_file, &state.cache_file).await {
                    state
                        .log(
                            "ERROR",
                            &format!("❌ [Persistent Cache] Rename échoué: {}", e),
                        )
                        .await;
                } else {
                    state
                        .log(
                            "INFO",
                            &format!(
                                "💾 [Persistent Cache] Sauvegarde effectuée ({} conservés, {} expirés purgés).",
                                snapshot.len(),
                                purged
                            ),
                        )
                        .await;
                }
            }
            Err(e) => {
                state
                    .log(
                        "ERROR",
                        &format!("❌ [Persistent Cache] Sauvegarde échouée: {}", e),
                    )
                    .await;
            }
        }
    }
}

// ============================================================
// Ascenseurs
// ============================================================
async fn refresh_elevators_from_api(state: &Arc<AppState>) {
    state
        .log(
            "INFO",
            "🔄 [Elevators 3x/jour] Vérification et actualisation des ascenseurs...",
        )
        .await;
    let url = "https://data.iledefrance-mobilites.fr/api/explore/v2.1/catalog/datasets/etat-des-ascenseurs/exports/csv?delimiter=%3B";

    let resp = state
        .http
        .get(url)
        .header("User-Agent", "FlowServer/1.0")
        .header("apiKey", &state.api_key)
        .timeout(Duration::from_secs(15))
        .send()
        .await;

    match resp {
        Ok(r) if r.status().is_success() => {
            if let Ok(csv_text) = r.text().await {
                let line_count = csv_text.lines().filter(|l| !l.trim().is_empty()).count();
                if line_count > 50 {
                    let _ = tokio::fs::write(&state.elevators_cache_file, &csv_text).await;
                    if let Some(db) = parse_elevators_csv(&csv_text) {
                        *state.elevators.write().await = db;
                        state
                            .log(
                                "INFO",
                                &format!(
                                    "✅ [Elevators 3x/jour] Mise à jour réussie ({} ascenseurs).",
                                    line_count.saturating_sub(1)
                                ),
                            )
                            .await;
                    }
                } else {
                    state
                        .log(
                            "INFO",
                            &format!(
                                "ℹ️ [Elevators 3x/jour] Peu de données ({} lignes), base conservée.",
                                line_count
                            ),
                        )
                        .await;
                }
            }
        }
        Ok(r) => {
            state
                .log(
                    "WARN",
                    &format!("⚠️ [Elevators 3x/jour] API status {}", r.status()),
                )
                .await;
        }
        Err(e) => {
            state
                .log(
                    "WARN",
                    &format!("⚠️ [Elevators 3x/jour] Erreur réseau: {}", e),
                )
                .await;
        }
    }
}

// ============================================================
// WebSocket Handler
// ============================================================
#[derive(Clone)]
struct DepartureSub {
    stop_ids: Vec<String>,
    line: String,
    direction: String,
}

async fn add_stop_interest(state: &Arc<AppState>, stop_ids: &[String]) {
    let mut counts = state.active_stop_counts.lock().await;
    for id in stop_ids {
        *counts.entry(id.clone()).or_insert(0) += 1;
    }
}

async fn remove_stop_interest(state: &Arc<AppState>, stop_ids: &[String]) {
    let mut counts = state.active_stop_counts.lock().await;
    for id in stop_ids {
        if let Some(c) = counts.get_mut(id) {
            if *c > 1 {
                *c -= 1;
            } else {
                counts.remove(id);
            }
        }
    }
}

fn dedup_and_sort_departures(deps: Vec<Arc<Value>>) -> Vec<Arc<Value>> {
    let mut seen = HashSet::new();
    let mut unique = Vec::new();
    for dep in deps {
        let time = dep
            .pointer("/stop_date_time/departure_date_time")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let line_label = dep
            .pointer("/display_informations/label")
            .or_else(|| dep.pointer("/display_informations/code"))
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let direction = dep
            .pointer("/display_informations/direction")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let key = format!("{}-{}-{}", line_label, direction, time);
        if seen.insert(key) {
            unique.push(dep);
        }
    }
    unique.sort_by(|a, b| {
        let ta = a
            .pointer("/stop_date_time/departure_date_time")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let tb = b
            .pointer("/stop_date_time/departure_date_time")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        ta.cmp(tb)
    });
    unique
}

async fn build_subscription_payload(
    state: &Arc<AppState>,
    dep_sub: &Option<DepartureSub>,
    station_sub: &Option<Vec<String>>,
) -> Option<String> {
    let mut all_deps = Vec::new();
    let is_station: bool;

    {
        let cache = state.departures.read().await;
        if let Some(sub) = dep_sub {
            is_station = false;
            for id in &sub.stop_ids {
                if let Some(entry) = cache.get(id) {
                    all_deps.extend(entry.data.iter().cloned());
                }
            }
            all_deps.retain(|d| {
                let d_line = d
                    .pointer("/display_informations/label")
                    .or_else(|| d.pointer("/display_informations/code"))
                    .and_then(|v| v.as_str())
                    .unwrap_or("");
                let d_dir = d
                    .pointer("/display_informations/direction")
                    .and_then(|v| v.as_str())
                    .unwrap_or("");
                d_line == sub.line && (d_dir.contains(&sub.direction) || sub.direction.contains(d_dir))
            });
        } else if let Some(stop_ids) = station_sub {
            is_station = true;
            for id in stop_ids {
                if let Some(entry) = cache.get(id) {
                    all_deps.extend(entry.data.iter().cloned());
                }
            }
        } else {
            return None;
        }
    }

    if all_deps.is_empty() {
        return None;
    }

    let unique = dedup_and_sort_departures(all_deps);
    let msg_type = if is_station {
        "station_update"
    } else {
        "departure_update"
    };
    Some(
        json!({
            "type": msg_type,
            "timestamp": Utc::now().to_rfc3339(),
            "data": { "departures": unique },
        })
        .to_string(),
    )
}

async fn ws_handler(
    ws: WebSocketUpgrade,
    State(state): State<Arc<AppState>>,
) -> impl IntoResponse {
    ws.on_upgrade(move |socket| handle_socket(socket, state))
}

async fn handle_socket(socket: WebSocket, state: Arc<AppState>) {
    let count = state.connected_clients.fetch_add(1, Ordering::SeqCst) + 1;
    state
        .log("INFO", &format!("🔌 Nouveau client WebSocket (Total: {})", count))
        .await;

    let (mut sender, mut receiver) = socket.split();
    let (out_tx, mut out_rx) = mpsc::unbounded_channel::<Message>();

    if let Some(push) = state.traffic.read().await.serialized_push.clone() {
        let _ = out_tx.send(Message::Text(push));
    }

    let writer_task = tokio::spawn(async move {
        while let Some(msg) = out_rx.recv().await {
            if sender.send(msg).await.is_err() {
                break;
            }
        }
    });

    let mut traffic_rx = state.traffic_tx.subscribe();
    let mut stop_rx = state.stop_update_tx.subscribe();
    let mut dep_sub: Option<DepartureSub> = None;
    let mut station_sub: Option<Vec<String>> = None;
    let mut ping_interval = tokio::time::interval(Duration::from_secs(30));
    ping_interval.tick().await;
    let mut awaiting_pong = false;
    let mut push_deadline: Option<tokio::time::Instant> = None;

    loop {
        tokio::select! {
            _ = ping_interval.tick() => {
                if awaiting_pong {
                    break;
                }
                awaiting_pong = true;
                if out_tx.send(Message::Ping(Vec::new())).is_err() {
                    break;
                }
            }
            _ = async {
                match push_deadline {
                    Some(deadline) => tokio::time::sleep_until(deadline).await,
                    None => std::future::pending::<()>().await,
                }
            }, if push_deadline.is_some() => {
                push_deadline = None;
                if let Some(payload) = build_subscription_payload(&state, &dep_sub, &station_sub).await {
                    if out_tx.send(Message::Text(payload)).is_err() {
                        break;
                    }
                }
            }
            res = traffic_rx.recv() => {
                match res {
                    Ok(payload) => {
                        if out_tx.send(Message::Text(payload)).is_err() {
                            break;
                        }
                    }
                    Err(broadcast::error::RecvError::Lagged(_)) => {
                        if let Some(push) = state.traffic.read().await.serialized_push.clone() {
                            if out_tx.send(Message::Text(push)).is_err() {
                                break;
                            }
                        }
                    }
                    Err(broadcast::error::RecvError::Closed) => break,
                }
            }
            res = stop_rx.recv() => {
                match res {
                    Ok(updated_stop) => {
                        let interested = dep_sub.as_ref().map(|s| s.stop_ids.contains(&updated_stop)).unwrap_or(false)
                            || station_sub.as_ref().map(|s| s.contains(&updated_stop)).unwrap_or(false);
                        if interested {
                            push_deadline = Some(tokio::time::Instant::now() + Duration::from_millis(300));
                        }
                    }
                    Err(broadcast::error::RecvError::Lagged(_)) => {
                        if dep_sub.is_some() || station_sub.is_some() {
                            push_deadline = Some(tokio::time::Instant::now() + Duration::from_millis(300));
                        }
                    }
                    Err(broadcast::error::RecvError::Closed) => break,
                }
            }
            msg_opt = receiver.next() => {
                match msg_opt {
                    Some(Ok(Message::Pong(_))) => {
                        awaiting_pong = false;
                    }
                    Some(Ok(Message::Text(text))) => {
                        if let Ok(val) = serde_json::from_str::<Value>(&text) {
                            let msg_type = val.get("type").and_then(|v| v.as_str()).unwrap_or("");
                            match msg_type {
                                "request_refresh" => {
                                    let st = Arc::clone(&state);
                                    tokio::spawn(async move { auto_refresh(st).await; });
                                }
                                "subscribe_departures" => {
                                    if let Some(data) = val.get("data") {
                                        let stop_ids: Vec<String> = data.get("stopIds").and_then(|v| v.as_array()).map(|a| a.iter().filter_map(|x| x.as_str().map(|s| s.to_string())).collect()).unwrap_or_default();
                                        let line = data.get("line").and_then(|v| v.as_str()).unwrap_or("").to_string();
                                        let direction = data.get("direction").and_then(|v| v.as_str()).unwrap_or("").to_string();
                                        if !stop_ids.is_empty() {
                                            if let Some(old) = &dep_sub {
                                                remove_stop_interest(&state, &old.stop_ids).await;
                                            }
                                            add_stop_interest(&state, &stop_ids).await;
                                            dep_sub = Some(DepartureSub { stop_ids: stop_ids.clone(), line, direction });
                                            if let Some(payload) = build_subscription_payload(&state, &dep_sub, &station_sub).await {
                                                let _ = out_tx.send(Message::Text(payload));
                                            }
                                            trigger_expired_stops(&state, &stop_ids).await;
                                        }
                                    }
                                }
                                "unsubscribe_departures" => {
                                    if let Some(old) = dep_sub.take() {
                                        remove_stop_interest(&state, &old.stop_ids).await;
                                    }
                                }
                                "subscribe_station" => {
                                    if let Some(stop_ids) = val.pointer("/data/stopIds").and_then(|v| v.as_array()) {
                                        let ids: Vec<String> = stop_ids.iter().filter_map(|x| x.as_str().map(|s| s.to_string())).collect();
                                        if !ids.is_empty() {
                                            if let Some(old) = &station_sub {
                                                remove_stop_interest(&state, old).await;
                                            }
                                            add_stop_interest(&state, &ids).await;
                                            station_sub = Some(ids.clone());
                                            if let Some(payload) = build_subscription_payload(&state, &dep_sub, &station_sub).await {
                                                let _ = out_tx.send(Message::Text(payload));
                                            }
                                            trigger_expired_stops(&state, &ids).await;
                                        }
                                    }
                                }
                                "unsubscribe_station" => {
                                    if let Some(old) = station_sub.take() {
                                        remove_stop_interest(&state, &old).await;
                                    }
                                }
                                _ => {}
                            }
                        }
                    }
                    Some(Ok(Message::Close(_))) | None | Some(Err(_)) => break,
                    _ => {}
                }
            }
        }
    }

    if let Some(old) = dep_sub {
        remove_stop_interest(&state, &old.stop_ids).await;
    }
    if let Some(old) = station_sub {
        remove_stop_interest(&state, &old).await;
    }
    writer_task.abort();
    let remaining = state.connected_clients.fetch_sub(1, Ordering::SeqCst).saturating_sub(1);
    state
        .log("INFO", &format!("🔌 Client déconnecté. Restant: {}", remaining))
        .await;
}

async fn trigger_expired_stops(state: &Arc<AppState>, stop_ids: &[String]) {
    let now = now_ms();
    let cache = state.departures.read().await;
    for id in stop_ids {
        let expired = match cache.get(id) {
            None => true,
            Some(c) => now.saturating_sub(c.timestamp) > 15_000 || c.source == "global",
        };
        if expired {
            let st = Arc::clone(state);
            let sid = id.clone();
            tokio::spawn(async move {
                refresh_stop(&st, &sid).await;
            });
        }
    }
}

// ============================================================
// REST Endpoints
// ============================================================
async fn get_logs(State(state): State<Arc<AppState>>) -> Json<Value> {
    let logs = state.logs.lock().await;
    let vec: Vec<String> = logs.iter().cloned().collect();
    Json(json!({ "logs": vec }))
}

async fn get_health(State(state): State<Arc<AppState>>) -> Json<Value> {
    let tc = state.traffic.read().await;
    let cache_age = if tc.timestamp > 0 {
        format!("{}s", (now_ms().saturating_sub(tc.timestamp)) / 1000)
    } else {
        "empty".to_string()
    };
    Json(json!({
        "status": "ok",
        "engine": "rust",
        "timestamp": Utc::now().to_rfc3339(),
        "connectedClients": state.connected_clients.load(Ordering::SeqCst),
        "lastUpdate": tc.last_full_update.clone().unwrap_or_else(|| "pas encore".to_string()),
        "cacheAge": cache_age,
        "trafficInterval": format!("{}s", TRAFFIC_REFRESH_INTERVAL_SECS),
        "activeRefreshInterval": format!("{}s", ACTIVE_REFRESH_INTERVAL_SECS),
    }))
}

async fn get_traffic(State(state): State<Arc<AppState>>) -> impl IntoResponse {
    let tc = state.traffic.read().await;
    if let Some(bytes) = &tc.serialized_rest {
        return (
            StatusCode::OK,
            [(header::CONTENT_TYPE, "application/json")],
            bytes.clone(),
        )
            .into_response();
    }
    (
        StatusCode::SERVICE_UNAVAILABLE,
        Json(json!({ "error": "Données pas encore disponibles, premier refresh en cours..." })),
    )
        .into_response()
}

#[derive(Deserialize)]
struct DeparturesQuery {
    force: Option<String>,
}

async fn get_departures(
    AxumPath(raw_id): AxumPath<String>,
    Query(query): Query<DeparturesQuery>,
    State(state): State<Arc<AppState>>,
) -> impl IntoResponse {
    let mut station_id = raw_id;
    if station_id.contains("stop_area") {
        if !station_id.starts_with("stop_area:") {
            station_id = format!("stop_area:{}", station_id);
        }
    } else if !station_id.starts_with("stop_point:") {
        station_id = format!("stop_point:{}", station_id);
    }

    if station_id.contains("stop_area:") && station_id.contains(":C") {
        return Json(json!({ "departures": [] }));
    }

    let is_force = query.force.as_deref() == Some("true");
    let now = now_ms();
    let (has_cache, is_expired) = {
        let cache = state.departures.read().await;
        match cache.get(&station_id) {
            None => (false, true),
            Some(c) => (
                true,
                now.saturating_sub(c.timestamp) > 20_000 || c.source == "global",
            ),
        }
    };

    if is_force || !has_cache {
        refresh_stop(&state, &station_id).await;
    } else if is_expired {
        let st = Arc::clone(&state);
        let sid = station_id.clone();
        tokio::spawn(async move {
            refresh_stop(&st, &sid).await;
        });
    }

    let cache = state.departures.read().await;
    if let Some(entry) = cache.get(&station_id) {
        let unique = dedup_and_sort_departures(entry.data.clone());
        return Json(json!({ "departures": unique }));
    }
    Json(json!({ "departures": [] }))
}

async fn get_itinerary(
    Query(params): Query<Vec<(String, String)>>,
    State(state): State<Arc<AppState>>,
) -> impl IntoResponse {
    let from = params.iter().find(|(k, _)| k == "from").map(|(_, v)| v.as_str());
    let to = params.iter().find(|(k, _)| k == "to").map(|(_, v)| v.as_str());
    let datetime = params
        .iter()
        .find(|(k, _)| k == "datetime")
        .map(|(_, v)| v.clone());

    if from.is_none() || to.is_none() {
        return (
            StatusCode::BAD_REQUEST,
            Json(json!({ "error": "Paramètres 'from' et 'to' requis" })),
        );
    }

    let mut req_params: Vec<(String, String)> = Vec::new();
    let mut has_count = false;
    let mut has_depth = false;
    for (k, v) in params {
        if k == "count" {
            has_count = true;
        }
        if k == "depth" {
            has_depth = true;
        }
        if k == "forbidden_uris" {
            req_params.push(("forbidden_uris[]".to_string(), v));
        } else {
            req_params.push((k, v));
        }
    }
    if !has_count {
        req_params.push(("count".to_string(), "5".to_string()));
    }
    if !has_depth {
        req_params.push(("depth".to_string(), "3".to_string()));
    }

    let url = match reqwest::Url::parse_with_params(&format!("{}/journeys", NAVITIA_BASE), &req_params)
    {
        Ok(u) => u.to_string(),
        Err(e) => {
            return (
                StatusCode::BAD_REQUEST,
                Json(json!({ "error": e.to_string() })),
            )
        }
    };

    match navitia_fetch(&state, &url).await {
        Ok(mut data) => {
            let disruptions: Vec<Value> = state
                .traffic
                .read()
                .await
                .disruptions
                .iter()
                .map(|d| (**d).clone())
                .collect();
            enrich_itinerary(&mut data, &disruptions, datetime.as_deref());
            (StatusCode::OK, Json(data))
        }
        Err(e) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            Json(json!({ "error": e })),
        ),
    }
}

#[derive(Deserialize)]
#[serde(rename_all = "camelCase")]
struct ElevatorsQuery {
    name: Option<String>,
    stop_area_id: Option<String>,
    lat: Option<f64>,
    lon: Option<f64>,
}

async fn get_elevators(
    AxumPath(station_id): AxumPath<String>,
    Query(query): Query<ElevatorsQuery>,
    State(state): State<Arc<AppState>>,
) -> Json<Value> {
    let db = state.elevators.read().await;
    let mut matched_lifts = None;
    let mut matched_name = query
        .name
        .clone()
        .unwrap_or_else(|| station_id.clone());

    if let Some(sa) = &query.stop_area_id {
        let clean: String = sa
            .split("IDFM:")
            .last()
            .unwrap_or(sa)
            .chars()
            .filter(|c| c.is_ascii_digit())
            .collect();
        if !clean.is_empty() {
            matched_lifts = db.zdc_map.get(&clean).cloned();
        }
    }

    if matched_lifts.is_none() && !station_id.is_empty() {
        let after_idfm = station_id.split("IDFM:").last().unwrap_or(&station_id);
        let before_underscore = after_idfm.split('_').next().unwrap_or(after_idfm);
        let clean: String = before_underscore
            .chars()
            .filter(|c| c.is_ascii_digit())
            .collect();
        if !clean.is_empty() {
            matched_lifts = db.zdc_map.get(&clean).cloned();
        }
    }

    if matched_lifts.is_none() {
        for candidate in [query.name.as_deref(), Some(station_id.as_str())]
            .into_iter()
            .flatten()
        {
            let norm = normalize_string(candidate);
            if !norm.is_empty() {
                if let Some(lifts) = db.name_map.get(&norm) {
                    matched_lifts = Some(lifts.clone());
                    break;
                }
            }
        }
    }

    if matched_lifts.is_none() {
        if let (Some(q_lat), Some(q_lon)) = (query.lat, query.lon) {
            let mut closest_dist = f64::INFINITY;
            for item in &db.coords_list {
                let d = get_distance_meters(q_lat, q_lon, item.lat, item.lon);
                if d < closest_dist && d <= 450.0 {
                    closest_dist = d;
                    matched_lifts = Some(item.lifts.clone());
                    matched_name = item.name.clone();
                }
            }
        }
    }

    if let Some(lifts) = matched_lifts.filter(|l| !l.is_empty()) {
        if !lifts[0].zdcname.is_empty() {
            matched_name = lifts[0].zdcname.clone();
        }
        let mut functional = 0usize;
        let details: Vec<Value> = lifts
            .iter()
            .map(|l| {
                let is_avail = l.liftstatus == "available" || l.liftstate == "1";
                if is_avail {
                    functional += 1;
                }
                json!({
                    "id": l.liftid,
                    "name": l.privateelevatorid,
                    "situation": l.liftsituation,
                    "direction": l.liftdirection,
                    "status": l.liftstatus,
                    "isAvailable": is_avail,
                    "reason": l.liftreason,
                    "lastUpdate": l.liftstateupdate,
                    "mode": l.liftmode,
                })
            })
            .collect();

        return Json(json!({
            "status": "success",
            "hasEquipments": true,
            "stationName": matched_name,
            "lastUpdate": db.last_update,
            "elevators": {
                "functional": functional,
                "total": lifts.len(),
                "details": details
            },
            "escalators": { "functional": 0, "total": 0 }
        }));
    }

    Json(json!({
        "status": "success",
        "hasEquipments": false,
        "stationName": matched_name,
        "lastUpdate": db.last_update,
        "elevators": { "functional": 0, "total": 0, "details": [] },
        "escalators": { "functional": 0, "total": 0 }
    }))
}

#[tokio::main]
async fn main() {
    let _ = dotenvy::dotenv();

    let port: u16 = std::env::var("PORT")
        .ok()
        .and_then(|p| p.parse().ok())
        .unwrap_or(3001);
    let api_key = std::env::var("IDFM_API_KEY").expect("IDFM_API_KEY manquante");

    let cache_dir = PathBuf::from("cache");
    let _ = tokio::fs::create_dir_all(&cache_dir).await;

    let (traffic_tx, _) = broadcast::channel(16);
    let (stop_update_tx, _) = broadcast::channel(4096);

    let cache_file = cache_dir.join("cache_departures.json");
    let elevators_file = PathBuf::from("etat-des-ascenseurs.csv");
    let elevators_cache_file = cache_dir.join("cache_etat_des_ascenseurs.csv");

    let initial_elevators =
        load_elevators_from_disk(&elevators_cache_file, &elevators_file).unwrap_or_default();

    let state = Arc::new(AppState {
        http: Client::new(),
        api_key,
        navitia_sem: Arc::new(Semaphore::new(MAX_CONCURRENT_REQUESTS)),
        traffic: RwLock::new(TrafficCache::default()),
        is_refreshing_traffic: AtomicBool::new(false),
        departures: RwLock::new(HashMap::new()),
        in_flight_stops: Mutex::new(HashMap::new()),
        active_stop_counts: Mutex::new(HashMap::new()),
        elevators: RwLock::new(initial_elevators),
        traffic_tx,
        stop_update_tx,
        connected_clients: AtomicUsize::new(0),
        logs: Mutex::new(VecDeque::with_capacity(MAX_LOG_LINES)),
        cache_file,
        elevators_cache_file,
    });

    load_persistent_cache(&state).await;
    state
        .log(
            "INFO",
            &format!(
                "🚀 FlowServer (Rust) démarré sur 0.0.0.0:{} ({} ascenseurs chargés)",
                port,
                state.elevators.read().await.total_lifts
            ),
        )
        .await;

    // Tâches en arrière-plan
    {
        let st = Arc::clone(&state);
        tokio::spawn(async move {
            auto_refresh(Arc::clone(&st)).await;
            let mut interval =
                tokio::time::interval(Duration::from_secs(TRAFFIC_REFRESH_INTERVAL_SECS));
            interval.tick().await;
            loop {
                interval.tick().await;
                auto_refresh(Arc::clone(&st)).await;
            }
        });
    }
    {
        let st = Arc::clone(&state);
        tokio::spawn(async move {
            refresh_all_global_rail_departures(Arc::clone(&st)).await;
            let mut interval =
                tokio::time::interval(Duration::from_secs(GLOBAL_RAIL_INTERVAL_SECS));
            interval.tick().await;
            loop {
                interval.tick().await;
                refresh_all_global_rail_departures(Arc::clone(&st)).await;
            }
        });
    }
    {
        let st = Arc::clone(&state);
        tokio::spawn(async move {
            let mut interval =
                tokio::time::interval(Duration::from_secs(ACTIVE_REFRESH_INTERVAL_SECS));
            loop {
                interval.tick().await;
                refresh_active_stops(Arc::clone(&st)).await;
            }
        });
    }
    {
        let st = Arc::clone(&state);
        tokio::spawn(async move {
            tokio::time::sleep(Duration::from_secs(5)).await;
            refresh_elevators_from_api(&st).await;
            let mut interval =
                tokio::time::interval(Duration::from_secs(ELEVATORS_REFRESH_INTERVAL_SECS));
            interval.tick().await;
            loop {
                interval.tick().await;
                refresh_elevators_from_api(&st).await;
            }
        });
    }
    {
        let st = Arc::clone(&state);
        tokio::spawn(async move {
            let mut interval = tokio::time::interval(Duration::from_secs(CACHE_SAVE_INTERVAL_SECS));
            interval.tick().await;
            loop {
                interval.tick().await;
                save_persistent_cache(&st).await;
            }
        });
    }

    let app = Router::new()
        .route("/", get(ws_handler))
        .route("/ws", get(ws_handler))
        .route("/api/logs", get(get_logs))
        .route("/api/health", get(get_health))
        .route("/api/traffic", get(get_traffic))
        .route("/api/departures/:stationId", get(get_departures))
        .route("/api/itinerary", get(get_itinerary))
        .route("/api/elevators/:stationId", get(get_elevators))
        .fallback(|| async { (StatusCode::NOT_FOUND, Json(json!({ "error": "Not Found" }))) })
        .layer(CorsLayer::permissive())
        .with_state(Arc::clone(&state));

    let listener = tokio::net::TcpListener::bind(("0.0.0.0", port))
        .await
        .expect("Impossible d'ouvrir le port");

    let st_shutdown = Arc::clone(&state);
    axum::serve(listener, app)
        .with_graceful_shutdown(async move {
            #[cfg(unix)]
            {
                let mut sigterm =
                    tokio::signal::unix::signal(tokio::signal::unix::SignalKind::terminate())
                        .expect("Impossible d'installer le handler SIGTERM");
                tokio::select! {
                    _ = tokio::signal::ctrl_c() => {},
                    _ = sigterm.recv() => {},
                }
            }
            #[cfg(not(unix))]
            {
                let _ = tokio::signal::ctrl_c().await;
            }
            st_shutdown
                .log("INFO", "🛑 Fermeture propre, sauvegarde du cache...")
                .await;
            save_persistent_cache(&st_shutdown).await;
        })
        .await
        .expect("Erreur serveur Axum");
}
