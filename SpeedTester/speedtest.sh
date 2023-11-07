#!/bin/bash
MQTT_HOST=emqx
MQTT_ID=speedtest
MQTT_TOPIC=speedtest
MQTT_OPTIONS=-r
MQTT_USER=speedtest
MQTT_PASS=speedtest123!

influx config create --config-name test --host-url "http://influxdb:8086" --org "speedtest" --token "speedtest123!" --active

file=~/ookla.json
echo "Speedtest has been started..."
echo ""

echo "$(date -Iseconds) starting speedtest"

#./influx -host influxdb -database speedtests -username speedtest -password speedtest123! -execute 'INSERT into speedtests'

 speedtest --accept-license -f json-pretty > ${file}

 echo "Speedtest finished"
 echo ""

 downraw=$(jq -r '.download.bandwidth' ${file})
 download=$(printf %.2f\\n "$((downraw * 8))e-6")
 upraw=$(jq -r '.upload.bandwidth' ${file})
 upload=$(printf %.2f\\n "$((upraw * 8))e-6")
 ping=$(jq -r '.ping.latency' ${file})
 jitter=$(jq -r '.ping.jitter' ${file})
 packetloss=$(jq -r '.packetLoss' ${file})
 serverid=$(jq -r '.server.id' ${file})
 servername=$(jq -r '.server.name' ${file})
 servercountry=$(jq -r '.server.country' ${file})
 serverlocation=$(jq -r '.server.location' ${file})
 serverhost=$(jq -r '.server.host' ${file})
 timestamp=$(jq -r '.timestamp' ${file})

 echo "$(date -Iseconds) speedtest results"
 echo "$(date -Iseconds) download = ${download} Mbps"
 echo "$(date -Iseconds) upload =  ${upload} Mbps"
 echo "$(date -Iseconds) ping =  ${ping} ms"
 echo "$(date -Iseconds) jitter = ${jitter} ms"


echo "#group,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE" >> /data/data.csv
echo "#default,_result,,,,," >> /data/data.csv
echo ",result,table,_time,_value,_field,_measurement,serverid,servername,servercountry,serverlocation,serverhost" >> /data/data.csv
echo ",,0,${timestamp},${download},download,mbps,${serverid},${servername},${servercountry},${serverlocation},${serverhost}" >> /data/data.csv
echo ",,0,${timestamp},${upload},upload,mbps,${serverid},${servername},${servercountry},${serverlocation},${serverhost}" >> /data/data.csv
echo ",,0,${timestamp},${ping},ping,seconds,${serverid},${servername},${servercountry},${serverlocation},${serverhost}" >> /data/data.csv
echo ",,0,${timestamp},${packetloss},packetloss,%,${serverid},${servername},${servercountry},${serverlocation},${serverhost}" >> /data/data.csv
echo "writing..."

influx write --bucket speedtests --file /data/data.csv

echo "finished"