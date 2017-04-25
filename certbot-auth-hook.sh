#!/bin/bash

# GET VARS
. _env.sh

# VALIDATE PARAMS
if [ -z "$CERTBOT_VALIDATION" ] || [ -z "$CERTBOT_TOKEN" ];then
  echo "MISSING VALIDATION OR TOKEN"
  exit 1
fi

# SAVE CERTBOT TOKEN
for host in ${CERTBOT_HOSTS[@]}; do
  ssh $host "mkdir -p $CERTBOT_CHALLENGE_PATH && echo $CERTBOT_VALIDATION > $CERTBOT_CHALLENGE_PATH/$CERTBOT_TOKEN" 
done

