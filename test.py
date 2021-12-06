#!/bin/python3
import requests
import json
import time

def echoz(string):
	print (str(time.strftime("%Y_%m_%d_%H_%M_%S"))+': '+string)

def getf(url,token):
	auth_token = "Bearer %s" % token
	header = {"Authorization": auth_token}
	response = requests.get(url,headers=header)
	return response.text

def putf(url, data):
	response = requests.put(url, json=data)
	return response.text

def posf(url, data):
	response = requests.post(url, json=data)
	return response.text

def delf(url, data, token):
	auth_token = "Bearer %s" % token
	header = {"Authorization": auth_token}
	response = requests.delete(url, json=data, headers=header)
	return response.text

#---------------------------------------------

epoch_time = int(time.time())

urlroot="https://demoqa.com"
xuser = 'user_' + str(epoch_time)
xpass = 'pAs!_' + str(epoch_time)

print ('')
print ('')
echoz ('Hello. We going to test '+urlroot+' using username: '+xuser+' and password: '+ xpass)
print ('')
print ('')


login_data = {"userName": xuser,"password": xpass}

echoz ('Chcecking Autorization')
output = json.loads(posf (urlroot+"/Account/v1/Authorized",login_data))
echoz (json.dumps(output))  #, sort_keys=True, indent=4

echoz ('Adding user')
output = json.loads(posf (urlroot+"/Account/v1/User",login_data))
echoz (json.dumps(output))  
userID = output["userID"]
echoz ("We have now user id: "+userID)  

echoz ('Generate Token')
output = json.loads(posf (urlroot+"/Account/v1/GenerateToken",login_data))
echoz (json.dumps(output))  
token = output["token"]
echoz ("We have token: "+token)  

echoz ('Chcecking Autorization')
output = json.loads(posf (urlroot+"/Account/v1/Authorized",login_data))
echoz (json.dumps(output))  

echoz ('User chceck ')
output = json.loads(getf (urlroot+"/Account/v1/User/"+userID,token))
echoz (json.dumps(output))  










echoz ('Deleting user')
output = delf (urlroot+"/Account/v1/User/"+userID,login_data,token)
echoz (output)

echoz ('User chceck ')
output = json.loads(getf (urlroot+"/Account/v1/User/"+userID,token))
echoz (json.dumps(output))  



print ('')
print ('')
echoz ('finish')
print ('')
print ('')



# BookStore
#getf (urlroot+"/BookStore/v1/Books")
#posf (urlroot+"/BookStore/v1/Books",data)
#delf (urlroot+"/BookStore/v1/Books")
#getf (urlroot+"/BookStore/v1/Book")
#delf (urlroot+"/BookStore/v1/Book",data)
#putf (urlroot+" /BookStore/v1/Books/{ISBN}",data)

