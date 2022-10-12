FROM nginx:1.14.2
#COPY ./certs /certs

RUN rm -v /etc/nginx/nginx.conf
ADD template.nginx.conf /etc/nginx/

ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# /bin/bash -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"

EXPOSE 80
EXPOSE 443

CMD ["./docker-entrypoint.sh"]
