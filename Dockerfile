FROM ubuntu:16.04

# Install curl, varnish and nginx
RUN apt-get update && apt-get install -y vim && apt-get install -y net-tools && apt-get install -y curl && apt-get install -y varnish && apt-get install -y nginx && apt-get install -y nodejs && service nginx start && service varnish start

COPY start-all.sh .
COPY varnish/varnish /etc/default/varnish
COPY varnish/default.vcl /etc/varnish/default.vcl
COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/my-page.html /var/www/html
COPY node/index.js .

ENV PATH=$PATH:$HOME
