#!/usr/bin/env bash


# ID NAME REPLICAS IMAGE COMMAND
# 1c36od6nzaep lcz-cron 1/1 git.farmacie.cz:5000/lekarna/lekarna-cron:latest 
# ae35awbts79k lcz-web 0/6 git.farmacie.cz:5000/development-lekarna-cz/lekarna-cz 
# dpdmx327su4n lcz-cli 1/1 git.farmacie.cz:5000/lekarna/lekarna-cli:latest 

IFS=$'\n'

echo '<<<docker_services:sep(59)>>>'

for line in `docker service ls  | tr -s ' ' | tail -n+2`; do
  SERVICE_ID=`echo -n "$line" | cut -d' ' -f1`
  SERVICE_NAME=`echo -n "$line" | cut -d' ' -f2`
  SERVICE_REPLICAS_RUNNING=`echo -n "$line" | cut -d' ' -f3 | cut -d'/' -f1`
  SERVICE_REPLICAS_TOTAL=`echo -n "$line" | cut -d' ' -f3 | cut -d'/' -f2`
  SERVICE_IMAGE=`echo -n "$line" | cut -d' ' -f4`
  SERVICE_COMMAND=`echo -n "$line" | cut -d' ' -f5` 

  echo "${SERVICE_ID};${SERVICE_NAME};${SERVICE_REPLICAS_RUNNING};${SERVICE_REPLICAS_TOTAL};${SERVICE_IMAGE};${SERVICE_COMMAND}"
done
