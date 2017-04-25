#!/bin/bash

# GET VARS
source _env.sh

# VALIDATE PARAMS
if [ -z "$CERTBOT_VALIDATION" ] || [ -z "$CERTBOT_TOKEN" ];then
  echo "MISSING VALIDATION OR TOKEN"
  exit 1
fi

# SAVE CERTBOT TOKEN
for host in ${CERTBOT_HOSTS[@]}; do
  ssh $host "rm -f $CERTBOT_PATH/$CERTBOT_TOKEN && /usr/local/nginx/sbin/nginx -s reload" 
done

