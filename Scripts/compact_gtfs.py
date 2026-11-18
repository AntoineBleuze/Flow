#!/usr/bin/env python3
"""
compact_gtfs.py — Phase 1 Pipeline d'extraction et de compactage GTFS pour le moteur CSA Flow.

Deux modes d'entrée supportés :
  1. Archive/dossier GTFS officiel (ex. IDFM Open Data) :
       python3 Scripts/compact_gtfs.py --gtfs /chemin/vers/IDFM-gtfs.zip --output Flow/Data/transit_schedule.bin
  2. Génération initiale à partir des référentiels locaux Flow (linesstops.json + gares/arrêts IDF) :
       python3 Scripts/compact_gtfs.py --bootstrap-from-flow --output Flow/Data/transit_schedule.bin

Sorties supportées :
  - Format binaire plat aligné (`FCSA` v1) indexé en Int32 pour lecture ultra-rapide en ContiguousArray<Connection>
  - Format JSON compact (`--json <chemin.json>`) indexé en Int32 pour inspection/debug
"""

from __future__ import annotations

import argparse
import csv
import datetime
import io
import json
import math
import struct
import sys
import unicodedata
import zipfile
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set, Tuple

MAGIC = b"FCSA"
FORMAT_VERSION = 1

# Modes de transport CSA (UInt8)
MODE_TRAM = 0
MODE_METRO = 1
MODE_RER = 2
MODE_TRANSILIEN = 3
MODE_CABLE = 4
MODE_BUS = 5


@dataclass
class CompactLine:
    id: int
    code: str
    name: str
    mode: int
    color_hex: str


@dataclass
class CompactStop:
    id: int
    name: str
    latitude: float
    longitude: float
    parent_station_id: Optional[int]


@dataclass
class CompactTransfer:
    from_stop: int
    to_stop: int
    duration_seconds: int


# Connection tuple: (departure_stop, arrival_stop, departure_time, arrival_time, trip_id, line_id)
ConnectionTuple = Tuple[int, int, int, int, int, int]


def normalize_name(text: str) -> str:
    text = unicodedata.normalize("NFD", text.lower().strip())
    text = "".join(ch for ch in text if unicodedata.category(ch) != "Mn")
    for ch in ("-", "'", "\u2019", ".", ",", "/", "(", ")"):
        text = text.replace(ch, " ")
    return " ".join(text.split())


def parse_gtfs_time(raw: str) -> Optional[int]:
    raw = raw.strip()
    if not raw:
        return None
    parts = raw.split(":")
    if len(parts) != 3:
        return None
    try:
        return int(parts[0]) * 3600 + int(parts[1]) * 60 + int(parts[2])
    except ValueError:
        return None


def haversine_meters(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    r = 6_371_000.0
    p1 = math.radians(lat1)
    p2 = math.radians(lat2)
    dp = math.radians(lat2 - lat1)
    dl = math.radians(lon2 - lon1)
    a = math.sin(dp / 2) ** 2 + math.cos(p1) * math.cos(p2) * math.sin(dl / 2) ** 2
    return 2 * r * math.atan2(math.sqrt(a), math.sqrt(1 - a))


class GTFSReader:
    """Lit indifféremment un dossier GTFS décompressé ou une archive .zip."""

    def __init__(self, source: Path):
        self.source = source
        self._zip: Optional[zipfile.ZipFile] = None
        self._zip_lookup: Dict[str, str] = {}
        if source.is_file() and zipfile.is_zipfile(source):
            self._zip = zipfile.ZipFile(source, "r")
            for member in self._zip.namelist():
                base = Path(member).name
                if base and not member.endswith("/"):
                    self._zip_lookup[base] = member
        elif not source.is_dir():
            raise FileNotFoundError(f"Source GTFS introuvable ou invalide : {source}")

    def close(self) -> None:
        if self._zip is not None:
            self._zip.close()

    def exists(self, filename: str) -> bool:
        if self._zip is not None:
            return filename in self._zip_lookup
        return (self.source / filename).is_file()

    def iter_csv(self, filename: str) -> Iterable[Dict[str, str]]:
        if not self.exists(filename):
            return
        if self._zip is not None:
            member = self._zip_lookup[filename]
            with self._zip.open(member, "r") as raw_stream:
                text_stream = io.TextIOWrapper(raw_stream, encoding="utf-8-sig", newline="")
                yield from csv.DictReader(text_stream)
        else:
            with open(self.source / filename, "r", encoding="utf-8-sig", newline="") as f:
                yield from csv.DictReader(f)


def select_representative_services(reader: GTFSReader) -> Optional[Set[str]]:
    """
    Sélectionne le jeu de service_id d'un mardi représentatif (hors jours fériés)
    afin de ne pas dupliquer les circulations de plusieurs jours dans la même table CSA.
    """
    if not reader.exists("calendar.txt") and not reader.exists("calendar_dates.txt"):
        return None

    date_counts: Dict[str, Set[str]] = defaultdict(set)
    weekday_services: List[Tuple[str, str, str]] = []

    if reader.exists("calendar.txt"):
        for row in reader.iter_csv("calendar.txt"):
            if row.get("tuesday") == "1":
                sid = row["service_id"].strip()
                start = row.get("start_date", "20000101").strip()
                end = row.get("end_date", "20991231").strip()
                weekday_services.append((sid, start, end))

    candidate_date: Optional[str] = None
    if weekday_services:
        starts = sorted(s for _, s, _ in weekday_services)
        mid_start = starts[len(starts) // 2]
        try:
            dt = datetime.datetime.strptime(mid_start, "%Y%m%d").date()
            while dt.weekday() != 1:  # 1 = Mardi
                dt += datetime.timedelta(days=1)
            candidate_date = dt.strftime("%Y%m%d")
            for sid, start, end in weekday_services:
                if start <= candidate_date <= end:
                    date_counts[candidate_date].add(sid)
        except ValueError:
            candidate_date = None

    if reader.exists("calendar_dates.txt"):
        for row in reader.iter_csv("calendar_dates.txt"):
            d = (row.get("date") or "").strip()
            sid = (row.get("service_id") or "").strip()
            exc = (row.get("exception_type") or "").strip()
            if candidate_date is not None:
                if d == candidate_date:
                    if exc == "1":
                        date_counts[candidate_date].add(sid)
                    elif exc == "2":
                        date_counts[candidate_date].discard(sid)
            else:
                if exc == "1":
                    date_counts[d].add(sid)

    if candidate_date and date_counts.get(candidate_date):
        return date_counts[candidate_date]

    if date_counts:
        best_date = max(date_counts.items(), key=lambda kv: len(kv[1]))[0]
        return date_counts[best_date]

    if weekday_services:
        return {sid for sid, _, _ in weekday_services}

    return None


def gtfs_mode_from_route(route_type: str, short_name: str) -> int:
    upper = short_name.upper().strip()
    if route_type == "0":
        return MODE_TRAM
    if route_type == "1":
        return MODE_METRO
    if route_type == "6":
        return MODE_CABLE
    if route_type == "2":
        if upper in {"A", "B", "C", "D", "E"} or upper.startswith("RER"):
            return MODE_RER
        return MODE_TRANSILIEN
    return MODE_BUS


def extract_from_gtfs(gtfs_path: Path, allowed_route_types: Set[str]) -> Tuple[
    List[CompactLine], List[CompactStop], List[CompactTransfer], List[ConnectionTuple]
]:
    reader = GTFSReader(gtfs_path)
    try:
        active_services = select_representative_services(reader)

        # 1. routes.txt
        route_id_to_line: Dict[str, int] = {}
        lines: List[CompactLine] = []
        for row in reader.iter_csv("routes.txt"):
            rtype = (row.get("route_type") or "").strip()
            if rtype not in allowed_route_types:
                continue
            rid = row["route_id"].strip()
            short_name = (row.get("route_short_name") or row.get("route_long_name") or rid).strip()
            long_name = (row.get("route_long_name") or short_name).strip()
            color = (row.get("route_color") or "0055C8").strip().lstrip("#")
            mode = gtfs_mode_from_route(rtype, short_name)
            code = short_name
            if mode == MODE_METRO and not code.upper().startswith("M"):
                code = f"M{code}"
            elif mode == MODE_RER and not code.upper().startswith("RER"):
                code = f"RER {code}"
            elif mode == MODE_TRAM and not code.upper().startswith("T"):
                code = f"T{code}"

            line_idx = len(lines)
            route_id_to_line[rid] = line_idx
            lines.append(
                CompactLine(
                    id=line_idx,
                    code=code,
                    name=long_name,
                    mode=mode,
                    color_hex=f"#{color}",
                )
            )

        # 2. trips.txt
        trip_id_to_int: Dict[str, Tuple[int, int]] = {}
        for row in reader.iter_csv("trips.txt"):
            rid = (row.get("route_id") or "").strip()
            if rid not in route_id_to_line:
                continue
            sid = (row.get("service_id") or "").strip()
            if active_services is not None and sid not in active_services:
                continue
            tid = row["trip_id"].strip()
            compact_tid = len(trip_id_to_int)
            trip_id_to_int[tid] = (compact_tid, route_id_to_line[rid])

        # 3. stop_times.txt
        used_gtfs_stops: Set[str] = set()
        stop_times_by_trip: Dict[int, List[Tuple[int, str, int, int]]] = defaultdict(list)

        for row in reader.iter_csv("stop_times.txt"):
            tid = (row.get("trip_id") or "").strip()
            trip_info = trip_id_to_int.get(tid)
            if trip_info is None:
                continue
            arr = parse_gtfs_time(row.get("arrival_time") or "")
            dep = parse_gtfs_time(row.get("departure_time") or "")
            if arr is None or dep is None:
                continue
            seq = int((row.get("stop_sequence") or "0").strip())
            stop_id_raw = row["stop_id"].strip()
            used_gtfs_stops.add(stop_id_raw)
            stop_times_by_trip[trip_info[0]].append((seq, stop_id_raw, arr, dep))

        # 4. stops.txt
        raw_stops: Dict[str, Dict[str, str]] = {}
        for row in reader.iter_csv("stops.txt"):
            raw_stops[row["stop_id"].strip()] = row

        parent_ids_needed: Set[str] = set()
        for sid in list(used_gtfs_stops):
            row = raw_stops.get(sid)
            if row:
                pid = (row.get("parent_station") or "").strip()
                if pid and pid in raw_stops:
                    parent_ids_needed.add(pid)

        all_keep_stops = parent_ids_needed | used_gtfs_stops
        gtfs_stop_to_int: Dict[str, int] = {}
        stops: List[CompactStop] = []

        for sid in sorted(parent_ids_needed):
            row = raw_stops[sid]
            idx = len(stops)
            gtfs_stop_to_int[sid] = idx
            stops.append(
                CompactStop(
                    id=idx,
                    name=(row.get("stop_name") or sid).strip(),
                    latitude=float(row.get("stop_lat") or 0.0),
                    longitude=float(row.get("stop_lon") or 0.0),
                    parent_station_id=None,
                )
            )

        for sid in sorted(all_keep_stops - parent_ids_needed):
            row = raw_stops.get(sid)
            if not row:
                continue
            pid_raw = (row.get("parent_station") or "").strip()
            parent_int = gtfs_stop_to_int.get(pid_raw) if pid_raw else None
            idx = len(stops)
            gtfs_stop_to_int[sid] = idx
            stops.append(
                CompactStop(
                    id=idx,
                    name=(row.get("stop_name") or sid).strip(),
                    latitude=float(row.get("stop_lat") or 0.0),
                    longitude=float(row.get("stop_lon") or 0.0),
                    parent_station_id=parent_int,
                )
            )

        # 5. transfers.txt + correspondances implicites intra-station parente
        transfer_map: Dict[Tuple[int, int], int] = {}
        if reader.exists("transfers.txt"):
            for row in reader.iter_csv("transfers.txt"):
                if (row.get("transfer_type") or "0").strip() == "3":
                    continue
                fs = gtfs_stop_to_int.get((row.get("from_stop_id") or "").strip())
                ts = gtfs_stop_to_int.get((row.get("to_stop_id") or "").strip())
                if fs is None or ts is None or fs == ts:
                    continue
                dur_str = (row.get("min_transfer_time") or "").strip()
                dur = int(dur_str) if dur_str.isdigit() else 180
                prev = transfer_map.get((fs, ts))
                if prev is None or dur < prev:
                    transfer_map[(fs, ts)] = dur

        children_by_parent: Dict[int, List[int]] = defaultdict(list)
        for s in stops:
            if s.parent_station_id is not None:
                children_by_parent[s.parent_station_id].append(s.id)

        for _, child_ids in children_by_parent.items():
            for a in child_ids:
                for b in child_ids:
                    if a != b and (a, b) not in transfer_map:
                        transfer_map[(a, b)] = 180

        transfers = [
            CompactTransfer(from_stop=a, to_stop=b, duration_seconds=dur)
            for (a, b), dur in sorted(transfer_map.items())
        ]

        # 6. Connexions triées par departureTime croissant
        trip_to_line: Dict[int, int] = {ctid: lid for ctid, lid in trip_id_to_int.values()}
        connections: List[ConnectionTuple] = []

        for compact_tid, st_list in stop_times_by_trip.items():
            if len(st_list) < 2:
                continue
            st_list.sort(key=lambda item: item[0])
            line_id = trip_to_line[compact_tid]
            for i in range(len(st_list) - 1):
                _, dep_sid_raw, _, dep_t = st_list[i]
                _, arr_sid_raw, arr_t, _ = st_list[i + 1]
                dep_sid = gtfs_stop_to_int.get(dep_sid_raw)
                arr_sid = gtfs_stop_to_int.get(arr_sid_raw)
                if dep_sid is None or arr_sid is None or dep_sid == arr_sid:
                    continue
                if arr_t < dep_t:
                    arr_t = dep_t
                connections.append((dep_sid, arr_sid, dep_t, arr_t, compact_tid, line_id))

        connections.sort(key=lambda c: (c[2], c[3], c[4]))
        return lines, stops, transfers, connections
    finally:
        reader.close()


# ---------------------------------------------------------------------------
# Mode Bootstrap depuis les fichiers locaux Flow (linesstops.json + gares IDF)
# ---------------------------------------------------------------------------


def extract_paths_from_line(line_obj: dict) -> List[List[str]]:
    """Extrait les parcours ordonnés (tronc + branches) d'une ligne de linesstops.json."""

    def station_names(items: list) -> List[str]:
        return [s["nom"] for s in items if not s.get("isUnderConstruction", False)]

    def decode_dir_field(val) -> Tuple[List[str], List[List[str]]]:
        if not val:
            return [], []
        if isinstance(val, list) and val:
            if "stations" in val[0]:
                return [], [station_names(b["stations"]) for b in val if b.get("stations")]
            return station_names(val), []
        return [], []

    structure = line_obj.get("structure", "linear")
    if "stations" in line_obj and line_obj["stations"]:
        names = station_names(line_obj["stations"])
        return [names] if len(names) >= 2 else []

    if structure == "branched":
        trunk = station_names(line_obj.get("tronc_commun") or line_obj.get("stations_tronc") or [])
        branches = [station_names(b["stations"]) for b in (line_obj.get("branches") or []) if b.get("stations")]
        if branches:
            paths = [trunk + br for br in branches if len(trunk + br) >= 2]
            return paths
        return [trunk] if len(trunk) >= 2 else []

    top_branches: List[List[str]] = []
    lead_in: List[str] = []
    trunk = station_names(
        line_obj.get("tronc_central")
        or line_obj.get("tronc_commun")
        or line_obj.get("stations_tronc")
        or []
    )
    end_branches: List[List[str]] = []
    lead_out: List[str] = []

    for key in ("branches_ouest", "branches_nord"):
        if line_obj.get(key):
            top_branches.extend(station_names(b["stations"]) for b in line_obj[key] if b.get("stations"))

    if not top_branches:
        for key in ("nord_ouest", "ouest", "nord"):
            lin, brs = decode_dir_field(line_obj.get(key))
            lead_in.extend(lin)
            top_branches.extend(brs)

    for key in ("branches_est", "branches_sud"):
        if line_obj.get(key):
            end_branches.extend(station_names(b["stations"]) for b in line_obj[key] if b.get("stations"))

    for key in ("sud", "est", "sud_est", "nord_est", "sud_ouest"):
        lin, brs = decode_dir_field(line_obj.get(key))
        lead_out.extend(lin)
        end_branches.extend(brs)

    starts = top_branches if top_branches else ([lead_in] if lead_in else [[]])
    ends = end_branches if end_branches else ([lead_out] if lead_out else [[]])

    paths: List[List[str]] = []
    max_pairs = max(len(starts), len(ends))
    for i in range(max_pairs):
        s_part = starts[i % len(starts)]
        e_part = ends[i % len(ends)]
        combined: List[str] = []
        for st in s_part + trunk + e_part:
            if not combined or combined[-1] != st:
                combined.append(st)
        if len(combined) >= 2:
            paths.append(combined)

    return paths


def load_flow_coordinates(data_dir: Path) -> Dict[str, Tuple[float, float]]:
    coords: Dict[str, Tuple[float, float]] = {}

    rail_json = data_dir / "gares-et-stations-du-reseau-ferre-dile-de-france-donnee-generalisee.json"
    if rail_json.is_file():
        with open(rail_json, "r", encoding="utf-8") as f:
            items = json.load(f)
        for item in items:
            gp = item.get("geo_point_2d") or {}
            lat = gp.get("lat")
            lon = gp.get("lon")
            if lat is None or lon is None:
                continue
            for field in ("nom_zdc", "nom_zda", "nom_long"):
                val = item.get(field)
                if val:
                    key = normalize_name(val)
                    coords.setdefault(key, (float(lat), float(lon)))

    arrets_csv = data_dir / "arrets-lignes.csv"
    if arrets_csv.is_file():
        with open(arrets_csv, "r", encoding="utf-8-sig", newline="") as f:
            reader = csv.DictReader(f, delimiter=";")
            for row in reader:
                mode = (row.get("mode") or "").lower()
                if mode == "bus":
                    continue
                name = row.get("stop_name") or ""
                try:
                    lat = float(row.get("stop_lat") or "")
                    lon = float(row.get("stop_lon") or "")
                except ValueError:
                    continue
                key = normalize_name(name)
                coords.setdefault(key, (lat, lon))

    return coords


def lookup_station_coord(name: str, coords: Dict[str, Tuple[float, float]]) -> Tuple[float, float]:
    norm = normalize_name(name)
    if norm in coords:
        return coords[norm]
    if " - " in name:
        prefix = normalize_name(name.split(" - ")[0])
        if prefix in coords:
            return coords[prefix]
    for k, val in coords.items():
        if len(norm) >= 5 and (norm in k or k in norm):
            return val
    return (48.8566, 2.3522)


def bootstrap_from_flow(project_root: Path) -> Tuple[
    List[CompactLine], List[CompactStop], List[CompactTransfer], List[ConnectionTuple]
]:
    data_dir = project_root / "Flow" / "Data"
    linesstops_path = data_dir / "linesstops.json"
    if not linesstops_path.is_file():
        raise FileNotFoundError(f"Fichier introuvable : {linesstops_path}")

    with open(linesstops_path, "r", encoding="utf-8") as f:
        network = json.load(f)

    coords_lookup = load_flow_coordinates(data_dir)

    lines: List[CompactLine] = []
    line_paths: List[Tuple[CompactLine, List[List[str]]]] = []
    unique_station_names: Dict[str, str] = {}

    for raw_line in network.get("lignes", []):
        paths = extract_paths_from_line(raw_line)
        if not paths:
            continue
        code = raw_line["id"].strip()
        ltype = (raw_line.get("type") or "metro").lower()
        if ltype == "metro":
            mode = MODE_METRO
        elif ltype == "rer":
            mode = MODE_RER
        elif ltype == "tram":
            mode = MODE_TRAM
        elif ltype in ("cable", "telepherique"):
            mode = MODE_CABLE
        else:
            mode = MODE_TRANSILIEN

        cline = CompactLine(
            id=len(lines),
            code=code,
            name=code,
            mode=mode,
            color_hex=raw_line.get("couleur") or "#0055C8",
        )
        lines.append(cline)
        line_paths.append((cline, paths))

        for path in paths:
            for sname in path:
                norm = normalize_name(sname)
                unique_station_names.setdefault(norm, sname)

    stops: List[CompactStop] = []
    parent_id_by_norm: Dict[str, int] = {}

    for norm in sorted(unique_station_names.keys()):
        display = unique_station_names[norm]
        lat, lon = lookup_station_coord(display, coords_lookup)
        sid = len(stops)
        parent_id_by_norm[norm] = sid
        stops.append(
            CompactStop(
                id=sid,
                name=display,
                latitude=lat,
                longitude=lon,
                parent_station_id=None,
            )
        )

    platform_stop_by_station_line: Dict[Tuple[int, int], int] = {}
    platforms_by_parent: Dict[int, List[int]] = defaultdict(list)

    for cline, paths in line_paths:
        seen_norms: Set[str] = set()
        for path in paths:
            for sname in path:
                norm = normalize_name(sname)
                if norm in seen_norms:
                    continue
                seen_norms.add(norm)
                parent_id = parent_id_by_norm[norm]
                parent_stop = stops[parent_id]
                pid = len(stops)
                platform_stop_by_station_line[(parent_id, cline.id)] = pid
                platforms_by_parent[parent_id].append(pid)
                stops.append(
                    CompactStop(
                        id=pid,
                        name=parent_stop.name,
                        latitude=parent_stop.latitude,
                        longitude=parent_stop.longitude,
                        parent_station_id=parent_id,
                    )
                )

    transfers: List[CompactTransfer] = []
    for _, plat_ids in sorted(platforms_by_parent.items()):
        if len(plat_ids) < 2:
            continue
        for a in plat_ids:
            for b in plat_ids:
                if a != b:
                    transfers.append(CompactTransfer(from_stop=a, to_stop=b, duration_seconds=180))

    def segment_travel_seconds(s1: CompactStop, s2: CompactStop, mode: int) -> int:
        dist = haversine_meters(s1.latitude, s1.longitude, s2.latitude, s2.longitude)
        if dist < 50 or dist > 25_000:
            defaults = {
                MODE_METRO: 95,
                MODE_TRAM: 105,
                MODE_RER: 165,
                MODE_TRANSILIEN: 210,
                MODE_CABLE: 150,
            }
            return defaults.get(mode, 110)

        speeds_mps = {
            MODE_METRO: 10.5,
            MODE_TRAM: 7.2,
            MODE_RER: 16.5,
            MODE_TRANSILIEN: 19.0,
            MODE_CABLE: 6.0,
        }
        dwells = {
            MODE_METRO: 20,
            MODE_TRAM: 20,
            MODE_RER: 30,
            MODE_TRANSILIEN: 35,
            MODE_CABLE: 20,
        }
        v = speeds_mps.get(mode, 10.0)
        d = dwells.get(mode, 20)
        return max(60, int(round(dist / v)) + d)

    def headway_seconds(t_sec: int, mode: int, num_branches: int) -> int:
        is_peak = (7 * 3600 <= t_sec <= 9 * 3600 + 1800) or (16 * 3600 + 1800 <= t_sec <= 19 * 3600 + 1800)
        is_night = t_sec < 6 * 3600 + 1800 or t_sec > 22 * 3600 + 1800
        base = {
            MODE_METRO: (150, 240, 420),
            MODE_RER: (240, 420, 720),
            MODE_TRAM: (300, 420, 660),
            MODE_TRANSILIEN: (600, 900, 1500),
            MODE_CABLE: (120, 180, 300),
        }.get(mode, (300, 480, 720))

        raw_hw = base[0] if is_peak else (base[2] if is_night else base[1])
        return raw_hw * max(1, min(num_branches, 4))

    connections: List[ConnectionTuple] = []
    next_trip_id = 0
    service_start = 5 * 3600 + 1800   # 05:30
    service_end = 25 * 3600 + 900     # 01:15 (lendemain)

    for cline, paths in line_paths:
        n_branches = len(paths)
        for branch_idx, path_names in enumerate(paths):
            plat_ids = [
                platform_stop_by_station_line[(parent_id_by_norm[normalize_name(n)], cline.id)]
                for n in path_names
            ]
            for direction_idx, seq_stops in enumerate((plat_ids, list(reversed(plat_ids)))):
                seg_durations = [
                    segment_travel_seconds(stops[seq_stops[i]], stops[seq_stops[i + 1]], cline.mode)
                    for i in range(len(seq_stops) - 1)
                ]
                offset = branch_idx * 90 + direction_idx * 45
                dep_cursor = service_start + offset
                while dep_cursor <= service_end:
                    trip_id = next_trip_id
                    next_trip_id += 1
                    cur_t = dep_cursor
                    for i, dur in enumerate(seg_durations):
                        arr_t = cur_t + dur
                        connections.append(
                            (seq_stops[i], seq_stops[i + 1], cur_t, arr_t, trip_id, cline.id)
                        )
                        cur_t = arr_t
                    dep_cursor += headway_seconds(dep_cursor, cline.mode, n_branches)

    connections.sort(key=lambda c: (c[2], c[3], c[4]))
    return lines, stops, transfers, connections


# ---------------------------------------------------------------------------
# Sérialisation binaire plate (`FCSA` v1) & JSON compact
# ---------------------------------------------------------------------------


def write_binary_schedule(
    output_path: Path,
    lines: List[CompactLine],
    stops: List[CompactStop],
    transfers: List[CompactTransfer],
    connections: List[ConnectionTuple],
) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    buf = bytearray()

    buf.extend(
        struct.pack(
            "<4sIIIII",
            MAGIC,
            FORMAT_VERSION,
            len(stops),
            len(lines),
            len(transfers),
            len(connections),
        )
    )

    for line in lines:
        code_b = line.code.encode("utf-8")
        name_b = line.name.encode("utf-8")
        color_b = line.color_hex.encode("utf-8")
        buf.extend(struct.pack("<iBH", line.id, line.mode, len(code_b)))
        buf.extend(code_b)
        buf.extend(struct.pack("<H", len(name_b)))
        buf.extend(name_b)
        buf.extend(struct.pack("<B", len(color_b)))
        buf.extend(color_b)

    for stop in stops:
        name_b = stop.name.encode("utf-8")
        parent_val = -1 if stop.parent_station_id is None else stop.parent_station_id
        buf.extend(
            struct.pack(
                "<iiddH",
                stop.id,
                parent_val,
                stop.latitude,
                stop.longitude,
                len(name_b),
            )
        )
        buf.extend(name_b)

    remainder = len(buf) % 4
    if remainder != 0:
        buf.extend(b"\x00" * (4 - remainder))

    for tr in transfers:
        buf.extend(struct.pack("<iii", tr.from_stop, tr.to_stop, tr.duration_seconds))

    conn_packer = struct.Struct("<iiiiii").pack
    for conn in connections:
        buf.extend(conn_packer(*conn))

    with open(output_path, "wb") as f:
        f.write(buf)


def write_compact_json(
    json_path: Path,
    lines: List[CompactLine],
    stops: List[CompactStop],
    transfers: List[CompactTransfer],
    connections: List[ConnectionTuple],
) -> None:
    json_path.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "version": FORMAT_VERSION,
        "lines": [
            {
                "id": l.id,
                "code": l.code,
                "name": l.name,
                "mode": l.mode,
                "colorHex": l.color_hex,
            }
            for l in lines
        ],
        "stops": [
            {
                "id": s.id,
                "name": s.name,
                "latitude": round(s.latitude, 6),
                "longitude": round(s.longitude, 6),
                "parentStationId": s.parent_station_id,
            }
            for s in stops
        ],
        "transfers": [[t.from_stop, t.to_stop, t.duration_seconds] for t in transfers],
        "connections": connections,
    }
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(payload, f, ensure_ascii=False, separators=(",", ":"))


def main() -> int:
    parser = argparse.ArgumentParser(description="Compacteur GTFS -> binaire CSA pour Flow")
    src_group = parser.add_mutually_exclusive_group(required=True)
    src_group.add_argument("--gtfs", type=Path, help="Chemin vers un dossier ou .zip GTFS")
    src_group.add_argument(
        "--bootstrap-from-flow",
        action="store_true",
        help="Générer le dataset initial depuis les référentiels ferrés locaux de Flow",
    )
    parser.add_argument(
        "--project-root",
        type=Path,
        default=Path(__file__).resolve().parent.parent,
        help="Racine du projet Flow",
    )
    parser.add_argument(
        "--output",
        type=Path,
        required=True,
        help="Chemin du fichier binaire de sortie (ex: Flow/Data/transit_schedule.bin)",
    )
    parser.add_argument(
        "--json",
        type=Path,
        default=None,
        help="Chemin optionnel d'export JSON compact indexé par Int32",
    )
    parser.add_argument(
        "--route-types",
        type=str,
        default="0,1,2,6,7",
        help="Types GTFS à inclure séparés par virgules (défaut: 0,1,2,6,7 = Tram/Métro/RER/Train/Câble)",
    )

    args = parser.parse_args()

    if args.gtfs:
        allowed_types = {t.strip() for t in args.route_types.split(",") if t.strip()}
        lines, stops, transfers, connections = extract_from_gtfs(args.gtfs, allowed_types)
    else:
        lines, stops, transfers, connections = bootstrap_from_flow(args.project_root)

    for i in range(len(connections) - 1):
        if connections[i][2] > connections[i + 1][2]:
            raise RuntimeError(
                f"Invariant CSA violé à l'index {i}: {connections[i][2]} > {connections[i + 1][2]}"
            )

    write_binary_schedule(args.output, lines, stops, transfers, connections)
    size_mb = args.output.stat().st_size / (1024 * 1024)
    parent_count = sum(1 for s in stops if s.parent_station_id is None)
    print(
        f"[OK] {args.output} généré ({size_mb:.2f} Mo) : "
        f"{len(lines)} lignes, {len(stops)} arrêts ({parent_count} stations parentes), "
        f"{len(transfers)} transferts, {len(connections)} connexions triées."
    )

    if args.json:
        write_compact_json(args.json, lines, stops, transfers, connections)
        json_mb = args.json.stat().st_size / (1024 * 1024)
        print(f"[OK] Export JSON compact écrit : {args.json} ({json_mb:.2f} Mo)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
