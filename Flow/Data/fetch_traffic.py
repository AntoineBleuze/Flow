import requests
import json

api_key = "YOUR_IDFM_API_KEY"
import datetime

# Get current date in format YYYYMMDDTHHMMSS
current_date = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
print(f"Filtering since: {current_date}")

url = f"https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia/disruptions?since={current_date}&count=100"
headers = {"apiKey": api_key}

all_disruptions = []
page_count = 0

while url:
    print(f"Fetching page {page_count}...")
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        print(f"Error: {response.status_code}")
        break
    
    data = response.json()
    disruptions = data.get("disruptions", [])
    all_disruptions.extend(disruptions)
    
    # Check for next link
    url = None
    if "pagination" in data:
        print(f"Pagination: {data['pagination']}")
    
    if "links" in data:
        for link in data["links"]:
            if link.get("rel") == "next":
                url = link.get("href")
                # print(f"Found next link: {url}")
                break
    
    page_count += 1
    # Safety break to avoid infinite loops if pagination is broken
    if page_count > 20:
        print("Reached safety limit of 20 pages.")
        break

print(f"Total disruptions fetched: {len(all_disruptions)}")

with open("full_traffic.json", "w") as f:
    json.dump(all_disruptions, f, indent=2)
