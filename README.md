# domotic files
A simple set 3 files to be used with the MIJIA LYWSD03MMC with custom firmwares (https://pvvx.github.io/ATC_MiThermometer/TelinkMiFlasher.html)

Bluetooth_utils.py : Python file needed for the LYWSD03MMC.py script
LYWSD03MMC.py : Python3 scripts that receives BLE info published by the thermometers and sends them with [temp, humi, batt, MAC] as parameters to sendToMQTT.sh
sendToMQTT.sh : simple bash script that recieves data from LYWSD03MMC.py and publish them to mosquitto MQTT as JSON. Topics are customisable by MAC ADRESS

