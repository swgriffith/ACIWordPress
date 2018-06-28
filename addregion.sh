#!/bin/bash

while getopts g:n:l:d:p: option
do
case "${option}"
in
g) RG=${OPTARG};;
n) NAME=${OPTARG};;
l) LOC=${OPTARG};;
d) DBNAME=${OPTARG};;
p) PRIORITY=${OPTARG};;

esac
done

echo RG: $RG
echo Name: $NAME
echo Location: $LOC
echo DatabaseName: $DBNAME
echo Priority: $PRIORITY

az container create -g $RG --name $NAME-$LOC --location $LOC --image wordpress --ip-address Public --os-type Linux --environment-variables WORDPRESS_DB_HOST=$DBNAME.mysql.database.azure.com WORDPRESS_DB_USER=griffith\@$DBNAME WORDPRESS_DB_PASSWORD=JWJIxoN7qdfd6F


az network traffic-manager endpoint create --name $NAME-$LOC --profile-name WordpressTrafficMngr -g $RG --type externalEndpoints --target $NAME.$LOC.azurecontainer.io --endpoint-location $LOC

