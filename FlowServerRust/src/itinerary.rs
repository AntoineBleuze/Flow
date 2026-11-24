use crate::elevators::normalize_string;
use chrono::Utc;
use chrono_tz::Europe::Paris;
use regex::Regex;
use serde_json::{json, Value};
use std::collections::HashMap;

struct LineImpact {
    impacted_stops_by_name: HashMap<String, String>,
    impacted_stop_ids: HashMap<String, String>,
    general_alerts: Vec<Value>,
}

pub fn enrich_itinerary(
    itinerary_data: &mut Value,
    disruptions: &[Value],
    target_datetime: Option<&str>,
) {
    if itinerary_data
        .get("journeys")
        .and_then(|v| v.as_array())
        .is_none()
        || disruptions.is_empty()
    {
        return;
    }

    let ref_date_str = match target_datetime {
        Some(s) if !s.is_empty() => s.to_string(),
        _ => Utc::now()
            .with_timezone(&Paris)
            .format("%Y%m%dT%H%M%S")
            .to_string(),
    };

    let station_regex = Regex::new(
        r"(?i)(?:station|gare|arrêt)\s+([A-ZÀ-Ýa-zà-ÿ0-9\s\-']+?)\s+(?:n'est pas desservi|est fermé|sera fermé)",
    )
    .ok();

    let mut line_impacts: HashMap<String, LineImpact> = HashMap::new();

    for d in disruptions {
        let status = d.get("status").and_then(|v| v.as_str()).unwrap_or("");
        if status == "past" {
            continue;
        }

        let is_active = if let Some(periods) =
            d.get("application_periods").and_then(|v| v.as_array())
        {
            if periods.is_empty() {
                status == "active"
            } else {
                periods.iter().any(|p| {
                    let begin = p.get("begin").and_then(|v| v.as_str());
                    let end = p.get("end").and_then(|v| v.as_str());
                    match (begin, end) {
                        (Some(b), Some(e)) => ref_date_str.as_str() >= b && ref_date_str.as_str() <= e,
                        (Some(b), None) => ref_date_str.as_str() >= b,
                        (None, Some(e)) => ref_date_str.as_str() <= e,
                        (None, None) => true,
                    }
                })
            }
        } else {
            status == "active"
        };

        if !is_active {
            continue;
        }

        let effect = d
            .pointer("/severity/effect")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let cause = d.get("cause").and_then(|v| v.as_str()).unwrap_or("");
        let cause_lower = cause.to_lowercase();
        let category_lower = d
            .get("category")
            .and_then(|v| v.as_str())
            .unwrap_or("")
            .to_lowercase();
        let main_msg = d
            .pointer("/messages/0/text")
            .and_then(|v| v.as_str())
            .unwrap_or("");
        let msg_lower = main_msg.to_lowercase();

        let is_closure = effect == "NO_SERVICE"
            || effect == "REDUCED_SERVICE"
            || msg_lower.contains("non desservi")
            || msg_lower.contains("non desservie")
            || msg_lower.contains("fermée")
            || msg_lower.contains("fermee")
            || msg_lower.contains("fermé")
            || msg_lower.contains("fermeture")
            || cause_lower.contains("travaux")
            || category_lower.contains("travaux");

        if !is_closure {
            continue;
        }

        let html_re = Regex::new(r"<[^>]+>").ok();
        let clean_msg = html_re
            .as_ref()
            .map(|re| re.replace_all(main_msg, "").trim().to_string())
            .unwrap_or_else(|| main_msg.trim().to_string());

        let reason = if !clean_msg.is_empty() && clean_msg.len() <= 140 {
            clean_msg.clone()
        } else if msg_lower.contains("travaux") {
            "Arrêt non desservi (travaux)".to_string()
        } else if !cause.is_empty() {
            format!("Arrêt non desservi ({})", cause)
        } else {
            "Arrêt non desservi".to_string()
        };

        let Some(impacted_objects) = d.get("impacted_objects").and_then(|v| v.as_array()) else {
            continue;
        };

        for obj in impacted_objects {
            let line_code = obj
                .pointer("/pt_object/line/code")
                .or_else(|| obj.pointer("/pt_object/name"))
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .trim()
                .to_lowercase();
            let line_id = obj
                .pointer("/pt_object/line/id")
                .or_else(|| obj.pointer("/pt_object/id"))
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .trim()
                .to_lowercase();

            let mut keys = Vec::new();
            if !line_code.is_empty() {
                keys.push(line_code);
            }
            if !line_id.is_empty() {
                keys.push(line_id);
            }

            for key in keys {
                let entry = line_impacts.entry(key).or_insert_with(|| LineImpact {
                    impacted_stops_by_name: HashMap::new(),
                    impacted_stop_ids: HashMap::new(),
                    general_alerts: Vec::new(),
                });

                if let Some(stops) = obj.get("impacted_stops").and_then(|v| v.as_array()) {
                    for s in stops {
                        if let Some(name) = s.pointer("/stop_point/name").and_then(|v| v.as_str()) {
                            let norm = normalize_string(name);
                            if !norm.is_empty() {
                                entry.impacted_stops_by_name.insert(norm, reason.clone());
                            }
                        }
                        if let Some(id) = s.pointer("/stop_point/id").and_then(|v| v.as_str()) {
                            entry
                                .impacted_stop_ids
                                .insert(id.to_lowercase(), reason.clone());
                        }
                    }
                }

                if let Some(re) = &station_regex {
                    for cap in re.captures_iter(main_msg) {
                        if let Some(m) = cap.get(1) {
                            let norm = normalize_string(m.as_str().trim());
                            if norm.len() >= 3 {
                                entry.impacted_stops_by_name.insert(norm, reason.clone());
                            }
                        }
                    }
                }

                entry.general_alerts.push(json!({
                    "id": d.get("id").cloned().unwrap_or(Value::Null),
                    "message": clean_msg,
                    "effect": effect,
                    "severity": d.get("severity").cloned().unwrap_or(Value::Null),
                }));
            }
        }
    }

    let Some(journeys) = itinerary_data
        .get_mut("journeys")
        .and_then(|v| v.as_array_mut())
    else {
        return;
    };

    for journey in journeys {
        let Some(sections) = journey.get_mut("sections").and_then(|v| v.as_array_mut()) else {
            continue;
        };

        for section in sections {
            if section.get("type").and_then(|v| v.as_str()) != Some("public_transport") {
                continue;
            }

            let code = section
                .pointer("/display_informations/code")
                .or_else(|| section.pointer("/display_informations/label"))
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .trim()
                .to_lowercase();
            let line_id = section
                .pointer("/display_informations/line/id")
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .trim()
                .to_lowercase();

            let impact = line_impacts
                .get(&code)
                .or_else(|| (!line_id.is_empty()).then(|| line_impacts.get(&line_id)).flatten());
            let Some(impact) = impact else {
                continue;
            };

            let mut section_has_closed = false;

            if let Some(stops) = section
                .get_mut("stop_date_times")
                .and_then(|v| v.as_array_mut())
            {
                for stop in stops {
                    let stop_name = stop
                        .pointer("/stop_point/name")
                        .and_then(|v| v.as_str())
                        .unwrap_or("");
                    let stop_id = stop
                        .pointer("/stop_point/id")
                        .and_then(|v| v.as_str())
                        .unwrap_or("")
                        .to_lowercase();
                    let stop_norm = normalize_string(stop_name);

                    let matched_reason = impact
                        .impacted_stop_ids
                        .get(&stop_id)
                        .cloned()
                        .or_else(|| impact.impacted_stops_by_name.get(&stop_norm).cloned())
                        .or_else(|| {
                            impact
                                .impacted_stops_by_name
                                .iter()
                                .find(|(norm_key, _)| {
                                    norm_key.len() >= 4
                                        && (stop_norm.contains(norm_key.as_str())
                                            || norm_key.contains(stop_norm.as_str()))
                                })
                                .map(|(_, r)| r.clone())
                        });

                    if let Some(reason) = matched_reason {
                        if let Some(obj) = stop.as_object_mut() {
                            obj.insert("is_skipped".to_string(), Value::Bool(true));
                            obj.insert("is_closed".to_string(), Value::Bool(true));
                            obj.insert("disruption_reason".to_string(), Value::String(reason));
                            section_has_closed = true;
                        }
                    }
                }
            }

            let from_name = section
                .pointer("/from/name")
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .to_string();
            let to_name = section
                .pointer("/to/name")
                .and_then(|v| v.as_str())
                .unwrap_or("")
                .to_string();
            let from_norm = normalize_string(&from_name);
            let to_norm = normalize_string(&to_name);

            if let Some(sec_obj) = section.as_object_mut() {
                if impact.impacted_stops_by_name.contains_key(&from_norm) {
                    sec_obj.insert("has_closed_stop".to_string(), Value::Bool(true));
                    sec_obj.insert(
                        "closed_stop_alert".to_string(),
                        Value::String(format!("La station de départ ({}) est fermée", from_name)),
                    );
                }
                if impact.impacted_stops_by_name.contains_key(&to_norm) {
                    sec_obj.insert("has_closed_stop".to_string(), Value::Bool(true));
                    sec_obj.insert(
                        "closed_stop_alert".to_string(),
                        Value::String(format!("La station d'arrivée ({}) est fermée", to_name)),
                    );
                }
                if section_has_closed {
                    sec_obj.insert("has_skipped_stops".to_string(), Value::Bool(true));
                }
                if !impact.general_alerts.is_empty() {
                    let alerts: Vec<Value> = impact.general_alerts.iter().take(2).cloned().collect();
                    sec_obj.insert("traffic_alerts".to_string(), Value::Array(alerts));
                }
            }
        }
    }
}
