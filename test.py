#!/bin/python3
import requests
import json

def getf(url):
	response = requests.get(url)
	return response.text

def putf(url, data):
	response = requests.put(url, json=data)
	return response.text

def posf(url, data):
	response = requests.post(url, json=data)
	return response.text

def delf(url, data):
	response = requests.delete(url, json=data)
	return response.text







urlroot="https://demoqa.com"

getf (urlroot+"/books")
getf (urlroot+"/Account/v1/User")

#putf (urlroot+"/books")

data = {"userName": "string","password": "string"}



output = json.loads(posf (urlroot+"/Account/v1/Authorized",data))

print (json.dumps(output, sort_keys=True, indent=4))


# Account
#posf (urlroot+"/Account/v1/Authorized",data)
#posf (urlroot+"/Account/v1/GenerateToken",data)
#posf (urlroot+"/Account/v1/User",data)
#delf (urlroot+"/Account/v1/User/{UUID}",data)
#getf (urlroot+"/Account/v1/User/{UUID}")

# BookStore
#getf (urlroot+"/BookStore/v1/Books")
#posf (urlroot+"/BookStore/v1/Books",data)
#delf (urlroot+"/BookStore/v1/Books",data)
#getf (urlroot+"/BookStore/v1/Book")
#delf (urlroot+"/BookStore/v1/Book",data)
#putf (urlroot+" /BookStore/v1/Books/{ISBN}",data)

