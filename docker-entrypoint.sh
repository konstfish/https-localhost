#!/usr/bin/env bash

export DOLLAR='$'

if [[ -z "${HOST}" ]]; then
  export HOST=172.17.0.1
fi

envsubst < /etc/nginx/template.nginx.conf > /etc/nginx/nginx.conf

#echo $PORT
#echo $HOST
#cat /etc/nginx/nginx.conf

nginx -g 'daemon off;'