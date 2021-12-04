#!/bin/python3
import requests

URL = "https://demoqa.com/books"


response = requests.get(URL)

print(response.text)
