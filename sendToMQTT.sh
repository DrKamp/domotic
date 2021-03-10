#!/bin/bash
#need to add sources and where everything was taken from

#this simple script publishes the data recovered from the LYWD03MMC scan script
#the previous script will just lunch the script with the temp, humidity, battery as parameters

#Variables to simplyfiy config
#mqtt-host="192.168.1.15"
mqtthost="localhost"
#mqttusername="openhabian"
#mqttpasswd="openhabian"

#loop for the MAC adress in the "replace table"
#if we find it, we set the topic variable and exit the loop
case $4 in
 *:A9:71:56) topic="Maison/Cellier";;
 *:3C:3D:90) topic="Maison/Salon";;
 *:FE:80:36) topic="Maison/Entree";;
 *:B9:20:6D) topic="Maison/Chambre";;
esac

#prepare message
mqttpayload="{\"temp\": \"$1\", \"humidity\": \"$2\", \"battery\": \"$3\"}"

#Publish the topic and payload
mosquitto_pub -h $mqtthost -t $topic -u "$mqttusername" -P "$mqttpasswd" -i "mibridge" -m "$mqttpayload"

