use serde::Serialize;
use std::collections::HashMap;
use std::path::Path;
use unicode_normalization::UnicodeNormalization;

#[derive(Clone, Debug, Serialize)]
pub struct LiftItem {
    pub liftid: String,
    pub privateelevatorid: String,
    pub liftsituation: String,
    pub liftdirection: String,
    pub liftstatus: String,
    pub liftreason: String,
    pub liftstateupdate: String,
    pub liftstate: String,
    pub zdcname: String,
    pub severity: String,
    pub liftmode: String,
    pub centroidzdc: String,
}

#[derive(Clone, Debug)]
pub struct CoordStation {
    pub _zdcid: String,
    pub name: String,
    pub lat: f64,
    pub lon: f64,
    pub lifts: Vec<LiftItem>,
}

#[derive(Default)]
pub struct ElevatorsDb {
    pub zdc_map: HashMap<String, Vec<LiftItem>>,
    pub name_map: HashMap<String, Vec<LiftItem>>,
    pub coords_list: Vec<CoordStation>,
    pub last_update: Option<String>,
    pub total_lifts: usize,
    pub _total_stations: usize,
}

pub fn normalize_string(input: &str) -> String {
    input
        .nfd()
        .filter(|c| !('\u{0300}'..='\u{036f}').contains(c))
        .flat_map(|c| c.to_lowercase())
        .filter(|c| c.is_ascii_alphanumeric())
        .collect()
}

pub fn get_distance_meters(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> f64 {
    let r = 6371e3_f64;
    let phi1 = lat1.to_radians();
    let phi2 = lat2.to_radians();
    let delta_phi = (lat2 - lat1).to_radians();
    let delta_lambda = (lon2 - lon1).to_radians();
    let a = (delta_phi / 2.0).sin().powi(2)
        + phi1.cos() * phi2.cos() * (delta_lambda / 2.0).sin().powi(2);
    let c = 2.0 * a.sqrt().atan2((1.0 - a).sqrt());
    r * c
}

pub fn parse_elevators_csv(csv_content: &str) -> Option<ElevatorsDb> {
    let lines: Vec<&str> = csv_content
        .lines()
        .map(|l| l.trim())
        .filter(|l| !l.is_empty())
        .collect();
    if lines.len() < 2 {
        return None;
    }

    let header: Vec<String> = lines[0]
        .trim_start_matches('\u{FEFF}')
        .split(';')
        .map(|h| h.trim().to_string())
        .collect();

    let mut new_zdc_map: HashMap<String, Vec<LiftItem>> = HashMap::new();
    let mut new_name_map: HashMap<String, Vec<LiftItem>> = HashMap::new();
    let mut lift_count = 0usize;
    let mut latest_update: Option<String> = None;

    for (i, line) in lines.iter().enumerate().skip(1) {
        let parts: Vec<&str> = line.split(';').collect();
        if parts.len() < header.len() {
            continue;
        }

        let mut row: HashMap<&str, &str> = HashMap::with_capacity(header.len());
        for (idx, h) in header.iter().enumerate() {
            row.insert(h.as_str(), parts[idx].trim());
        }

        let zdcid = row.get("zdcid").copied().unwrap_or("");
        if zdcid.is_empty() {
            continue;
        }

        let liftid = row.get("liftid").copied().unwrap_or("");
        let liftstate = row.get("liftstate").copied().unwrap_or("");
        let raw_status = row.get("liftstatus").copied().unwrap_or("");
        let liftstatus = if !raw_status.is_empty() {
            raw_status.to_string()
        } else if liftstate == "1" {
            "available".to_string()
        } else if liftstate == "2" {
            "notavailable".to_string()
        } else {
            "unknown".to_string()
        };

        let privateelevatorid = row
            .get("privateelevatorid")
            .copied()
            .filter(|s| !s.is_empty())
            .map(|s| s.to_string())
            .unwrap_or_else(|| {
                if liftid.is_empty() {
                    format!("Ascenseur {}", i)
                } else {
                    format!("Ascenseur {}", liftid)
                }
            });

        let liftstateupdate = row.get("liftstateupdate").copied().unwrap_or("").to_string();
        if !liftstateupdate.is_empty()
            && latest_update
                .as_ref()
                .map(|cur| liftstateupdate > *cur)
                .unwrap_or(true)
        {
            latest_update = Some(liftstateupdate.clone());
        }

        let zdcname = row.get("zdcname").copied().unwrap_or("").to_string();

        let item = LiftItem {
            liftid: if liftid.is_empty() {
                (lift_count + 1).to_string()
            } else {
                liftid.to_string()
            },
            privateelevatorid,
            liftsituation: row.get("liftsituation").copied().unwrap_or("").to_string(),
            liftdirection: row.get("liftdirection").copied().unwrap_or("").to_string(),
            liftstatus,
            liftreason: row.get("liftreason").copied().unwrap_or("").to_string(),
            liftstateupdate,
            liftstate: liftstate.to_string(),
            zdcname: zdcname.clone(),
            severity: row
                .get("severity")
                .copied()
                .filter(|s| !s.is_empty())
                .unwrap_or("1")
                .to_string(),
            liftmode: row.get("liftmode").copied().unwrap_or("").to_string(),
            centroidzdc: row.get("centroidzdc").copied().unwrap_or("").to_string(),
        };

        new_zdc_map
            .entry(zdcid.to_string())
            .or_default()
            .push(item.clone());

        let norm_name = normalize_string(&zdcname);
        if !norm_name.is_empty() {
            new_name_map.entry(norm_name).or_default().push(item);
        }
        lift_count += 1;
    }

    let mut coords_list = Vec::new();
    for (zdcid, lifts) in &new_zdc_map {
        if let Some(first) = lifts.iter().find(|l| l.centroidzdc.contains(',')) {
            let mut split = first.centroidzdc.split(',').map(|s| s.trim());
            if let (Some(lat_s), Some(lon_s)) = (split.next(), split.next()) {
                if let (Ok(lat), Ok(lon)) = (lat_s.parse::<f64>(), lon_s.parse::<f64>()) {
                    coords_list.push(CoordStation {
                        _zdcid: zdcid.clone(),
                        name: first.zdcname.clone(),
                        lat,
                        lon,
                        lifts: lifts.clone(),
                    });
                }
            }
        }
    }

    let total_stations = new_zdc_map.len();
    Some(ElevatorsDb {
        zdc_map: new_zdc_map,
        name_map: new_name_map,
        coords_list,
        last_update: latest_update.or_else(|| Some(chrono::Utc::now().to_rfc3339())),
        total_lifts: lift_count,
        _total_stations: total_stations,
    })
}

pub fn load_elevators_from_disk(cache_file: &Path, source_file: &Path) -> Option<ElevatorsDb> {
    if cache_file.exists() {
        if let Ok(content) = std::fs::read_to_string(cache_file) {
            if let Some(db) = parse_elevators_csv(&content) {
                return Some(db);
            }
        }
    }
    if source_file.exists() {
        if let Ok(content) = std::fs::read_to_string(source_file) {
            if let Some(db) = parse_elevators_csv(&content) {
                return Some(db);
            }
        }
    }
    None
}
