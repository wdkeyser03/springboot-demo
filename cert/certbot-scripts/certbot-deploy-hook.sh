#! /bin/bash

echo "Certbot deploy-hook: $(date +%F-%T) - $RENEWED_DOMAINS " >> /home/willy/IdeaProjects/springboot-demo/cert/certbot-log/certbot-deploy-hook.log

rm -f /home/willy/IdeaProjects/springboot-demo/cert/certificate.crt
rm -f /home/willy/IdeaProjects/springboot-demo/cert/private.key

cp /etc/letsencrypt/live/willy-myhomelab.duckdns.org/fullchain.pem /home/willy/IdeaProjects/springboot-demo/cert/fullchain.pem
cp /etc/letsencrypt/live/willy-myhomelab.duckdns.org/privkey.pem /home/willy/IdeaProjects/springboot-demo/cert/privkey.pem

openssl pkey -in /home/willy/IdeaProjects/springboot-demo/cert/privkey.pem -out /home/willy/IdeaProjects/springboot-demo/cert/private.key
openssl x509 -in /home/willy/IdeaProjects/springboot-demo/cert/fullchain.pem -out /home/willy/IdeaProjects/springboot-demo/cert/certificate.crt

chown willy:willy /home/willy/IdeaProjects/springboot-demo/cert/certificate.crt
chown willy:willy /home/willy/IdeaProjects/springboot-demo/cert/private.key

rm -f /home/willy/IdeaProjects/springboot-demo/cert/fullchain.pem
rm -f /home/willy/IdeaProjects/springboot-demo/cert/privkey.pem