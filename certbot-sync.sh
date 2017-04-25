#!/bin/bash

RESTART_CMD="/usr/local/nginx/sbin/nginx -s reload"
#RESTART_CMD="/usr/local/nginx/sbin/nginx -h"

# GET PARAMS
source _env.sh

# COPY CERTS TO ALL HOSTS
for host in ${CERTBOT_HOSTS[@]}; do
  rsync -avp $CERTBOT_CERT_PATH/ $host:$CERTBOT_CERT_PATH/
done

# RESTART NGINX
for host in ${CERTBOT_HOSTS[@]}; do
  ssh $host "$RESTART_CMD"
done
