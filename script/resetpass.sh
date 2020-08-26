!/bin/bash
environment=$Environment
username=$Username
password=$(mkpasswd -l 12 2> /dev/null)
url1="http://192.168.56.102:9200"

if [[ $environment == "pro" ]]; then

curl -k --user elastic:gV2okuT65fJwP3fkrOyd -XPOST ${url1}/_security/user/${username}/_password?pretty -H 'Content-Type: application/json' -d'{"password" : "'"${password}"'"}}'

else

curl -k --user elastic:gV2okuT65fJwP3fkrOyd -XPOST ${url1}/_security/user/${username}/_password?pretty -H 'Content-Type: application/json' -d'{"password" : ${password}}'

fi

echo "The password is :"  $password
