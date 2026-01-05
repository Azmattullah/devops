import requests

URL = "https://bestcast.co/"

try:
    response = requests.get(URL, timeout=5)
    if response.status_code != 200:
        print(f"ALERT: {URL} returned {response.status_code}")
    else:
        print(f"{URL} is reachable with status code {response.status_code}")
except requests.RequestException as e:
    print(f"ALERT: {URL} is unreachable ({e})")
