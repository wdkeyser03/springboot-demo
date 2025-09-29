#! /bin/bash

echo "Certbot post-hook: $(date +%F-%T) - $RENEWED_DOMAINS " >> /home/willy/IdeaProjects/springboot-demo/cert/certbot-log/certbot-post-hook.log