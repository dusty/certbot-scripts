export CERTBOT_STAGING="--staging --dry-run"
export CERTBOT_EMAIL="me@example.com"
export CERTBOT_HOSTS=(app1 app2)
export CERTBOT_DOMAINS=(app1.example.com app2.example.com app.example.com)
export CERTBOT_CHALLENGE_PATH=/var/www/letsencrypt/.well-known/acme-challenge
export CERTBOT_CERT_PATH=/etc/letsencrypt/live
