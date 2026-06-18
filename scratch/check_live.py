import urllib.request
import json
import sys

URLS = [
    "http://localhost:7860/v1/healthz",
    "http://localhost:7860/v1/metadata"
]

for url in URLS:
    try:
        print(f"Testing {url}...")
        resp = urllib.request.urlopen(url, timeout=15)
        print(f"Status: {resp.getcode()}")
        print(f"Body: {resp.read().decode()}")
    except Exception as e:
        print(f"Error at {url}: {e}")
