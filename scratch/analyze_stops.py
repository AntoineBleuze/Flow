import csv
import json

json_path = "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee.json"
csv_path = "/Users/antoinebleuze/Documents/projet xcode/Flow/Flow/Data/arrets-lignes.csv"

stop_areas = set()
stop_points = set()

# 1. Parse railway JSON
with open(json_path, 'r', encoding='utf-8') as f:
    items = json.load(f)
    for item in items:
        # StopAreaId
        id_ref_zdc = item.get('id_ref_zdc')
        if id_ref_zdc:
            stop_areas.add(f"stop_area:IDFM:{id_ref_zdc}")
        
        # StopPointId (code unique)
        code_val = item.get('codeunique') or item.get('objectid_1')
        if code_val:
            code = str(code_val)
            res_com = item.get('res_com') or ""
            line_parts = [p.strip() for p in res_com.split('/')]
            for part in line_parts:
                line_name = part.replace("METRO ", "").replace("RER ", "").replace("TRAM ", "").replace("TRAIN ", "").replace("CABLE ", "")
                stop_points.add(f"stop_point:{code}_{line_name}")

# 2. Parse CSV
with open(csv_path, 'r', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter=';')
    header = next(reader)
    for row in reader:
        if len(row) <= 8:
            continue
        stop_id = row[2].strip()
        stop_area_id = row[0].strip()
        
        if stop_area_id:
            stop_areas.add(f"stop_area:{stop_area_id}")
        if stop_id:
            stop_points.add(f"stop_point:{stop_id}")

print(f"Unique Stop Areas: {len(stop_areas)}")
print(f"Unique Stop Points: {len(stop_points)}")
