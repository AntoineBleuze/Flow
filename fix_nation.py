#!/usr/bin/env python3
"""Script pour corriger les coordonnées de la station Nation"""

import csv

# Coordonnées correctes de Nation
CORRECT_LAT = "48.848617"
CORRECT_LON = "2.396372"

input_file = "Flow/Data/arrets-lignes-2.csv"
output_file = "Flow/Data/arrets-lignes-2_fixed.csv"

corrections = 0

with open(input_file, 'r', encoding='utf-8') as f_in, \
     open(output_file, 'w', encoding='utf-8', newline='') as f_out:
    
    for line in f_in:
        # Séparer avec point-virgule
        fields = line.strip().split(';')
        
        if len(fields) >= 4:
            station_name = fields[3]  # Le nom de la station
            
            # Si c'est "Nation" (et pas "Nationale" ou autres)
            if station_name == "Nation":
                # Vérifier que c'est bien une ligne de métro ou RER
                if len(fields) >= 9:
                    transport_type = fields[8]
                    if transport_type in ["Metro", "RapidTransit"]:
                        # Corriger les coordonnées (colonnes 4 et 5, et aussi 9 et 10)
                        fields[4] = CORRECT_LON  # Longitude
                        fields[5] = CORRECT_LAT  # Latitude
                        fields[9] = f"{CORRECT_LAT}, {CORRECT_LON}"  # Coordonnées combinées
                        corrections += 1
                        print(f"Corrigé: Ligne {fields[2]}, {fields[1]} - {station_name}")
        
        # Écrire la ligne (modifiée ou non)
        f_out.write(';'.join(fields) + '\n')

print(f"\nTotal de corrections: {corrections}")
print(f"Fichier corrigé sauvegardé dans: {output_file}")
