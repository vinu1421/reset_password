#!/bin/bash
environment=$Environment
username=$Username
password=$(mkpasswd -l 12 2> /dev/null)
url1="http://192.168.56.102:9200"

if [[ $environment == "pro" ]]; then

response=$(curl -k  --user $elk_user:$elk_pass -XPOST ${url1}/_security/user/${username}/_password?pretty -H 'Content-Type: application/json' -d'{"password" : "'"${password}"'"}}')

else

curl -k --user elastic:gV2okuT65fJwP3fkrOyd -XPOST ${url1}/_security/user/${username}/_password?pretty -H 'Content-Type: application/json' -d'{"password" : ${password}}'

fi
echo $response
#if [[ response -eq 200 ]]; then
#echo "Password reset successful, The password is :"  $password
#else
#echo "Reset failed, please check the username"
#echo $elk_pass $elk_user
#exit 2
#fi

#echo $elk_pass $elk_user
