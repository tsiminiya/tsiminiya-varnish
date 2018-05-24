#! /bin/sh

service nginx start && service varnish start && \

echo Running Node.js App...

nodejs index.js & \

varnishlog




