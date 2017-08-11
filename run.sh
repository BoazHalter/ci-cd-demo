#!/bin/bash

#Remove elk
docker rm -f $(docker ps -aq)

# Run Elasticsearch
docker run -d -p 9200:9200 -e "http.host=172.31.35.204" -e "transport.host=127.0.0.1" elasticsearch:5.5.1
# Run kibana
docker run  -e ELASTICSEARCH_URL=http://172.31.35.204:9200 -p 5601:5601 -d kibana
# Run logstash
docker run  -d -v /home/ec2-user/gitrepo/ci-cd-demo/:/config-dir  -v /var/log/:/usr/share/logstash/data logstash -f /config-dir/logstash.conf

docker ps