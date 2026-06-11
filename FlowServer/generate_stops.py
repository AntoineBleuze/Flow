import csv
import json
import os

json_path = "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee.json"
csv_path = "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/arrets-lignes.csv"
output_path = "/Users/antoinebleuze/Documents/projet xcode/Flow/FlowServer/stops.json"

railway_ids = set()
bus_ids = set()

# Helper to clean ID
def clean_id(val):
    if not val:
        return ""
    return val.replace("stop_point:", "").replace("stop_area:", "").strip()

# 1. Parse railway JSON
if os.path.exists(json_path):
    print(f"Parsing {json_path}...")
    with open(json_path, 'r', encoding='utf-8') as f:
        items = json.load(f)
        for item in items:
            code_val = item.get('codeunique') or item.get('objectid_1')
            if not code_val:
                continue
            code = str(code_val)
            
            res_com = item.get('res_com') or ""
            line_parts = [p.strip() for p in res_com.split('/')]
            
            id_ref_zdc = item.get('id_ref_zdc')
            stop_area_id = f"IDFM:{id_ref_zdc}" if id_ref_zdc else ""
            
            for part in line_parts:
                line_name = part.replace("METRO ", "").replace("RER ", "").replace("TRAM ", "").replace("TRAIN ", "").replace("CABLE ", "")
                stop_point_id = f"{code}_{line_name}"
                
                clean_point_id = clean_id(stop_point_id)
                clean_area_id = clean_id(stop_area_id)
                
                if clean_area_id and "IDFM:C" not in stop_area_id and ":C" not in stop_area_id:
                    railway_ids.add(f"stop_area:{clean_area_id}")
                else:
                    railway_ids.add(f"stop_point:{clean_point_id}")

# 2. Parse CSV
if os.path.exists(csv_path):
    print(f"Parsing {csv_path}...")
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, delimiter=';')
        header = next(reader)
        for row in reader:
            if len(row) <= 8:
                continue
            stop_id = row[2].strip()
            stop_area_id = row[0].strip()
            mode = row[8].strip().lower()
            
            clean_stop_id = clean_id(stop_id)
            clean_area_id = clean_id(stop_area_id)
            
            if mode == "bus":
                bus_ids.add(f"stop_point:{clean_stop_id}")
            else:
                if clean_area_id and "IDFM:C" not in stop_area_id and ":C" not in stop_area_id:
                    railway_ids.add(f"stop_area:{clean_area_id}")
                else:
                    railway_ids.add(f"stop_point:{clean_stop_id}")

railway_list = sorted(list(railway_ids))
bus_list = sorted(list(bus_ids))
print(f"Generated {len(railway_list)} railway and {len(bus_list)} bus query IDs.")

output_data = {
    "railway": railway_list,
    "bus": bus_list
}

with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(output_data, f, indent=2)
print(f"Saved to {output_path}")
