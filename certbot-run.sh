#!/bin/bash

# GET PARAMS
source _env.sh

# BASE CMD
CERTBOT_AUTH_HOOK=/opt/scripts/certbot-auth-hook.sh
CERTBOT_CLEANUP_HOOK=/opt/scripts/certbot-cleanup-hook.sh
CERTBOT_CMD="/usr/bin/certbot certonly --manual --agree-tos --manual-public-ip-logging-ok --preferred-challenges=http --manual-auth-hook $CERTBOT_AUTH_HOOK --manual-cleanup-hook $CERTBOT_CLEANUP_HOOK -m $CERTBOT_EMAIL $CERTBOT_STAGING"

# ADD DOMAINS
for domain in ${CERTBOT_DOMAINS[@]}; do
  CERTBOT_CMD="$CERTBOT_CMD -d $domain"
done

# RUN
echo $CERTBOT_CMD
