FROM nginx:mainline-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash tzdata \
    && adduser -D -H -u 1000 -s /bin/bash www-data \
    && rm /etc/nginx/conf.d/default.conf

ADD html/ /usr/share/nginx/html/
ADD sites-enabled/ /etc/nginx/sites-enabled/
ADD ssl/ /etc/nginx/ssl/
ADD nginx.conf /etc/nginx/

RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

EXPOSE 80 443

CMD ["nginx"]


