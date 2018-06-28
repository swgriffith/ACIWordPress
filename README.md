#Set variables
RG=<Resource Group Name>
LOC=<Base Region>
NAME=<Deployment Name>

#Create Resource Group
az group create -n $RG -l $LOC

#Deploy Template for Initial container instance, MySQL and the Traffic Manager
az group deployment create --name $NAME --template-file wordpressdeploy.json --parameters @wordpressdeploy.parameters.json -g ThrowAwayWordPressDemo --verbose 

#Execute Script to add a region (dont forget to chmod +x the file)
./addregion.sh -g ThrowAwayWordPressDemo -n wordpress -l <New Region Name> -d griffwpmysql 
