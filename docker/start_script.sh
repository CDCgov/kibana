#!/bin/bash
# 1. initializes container with ENV variables set by OpenShift templates:
#       - ${ELASTICSSEARCH_URL} -> elasticsearch.url
# 2. starts up kibana


##### 1 #####
#rm ${KIBANA_CONFIG}/kibana.yml
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g; s|__ELASTICSEARCH_USERNAME__|$ELASTICSEARCH_USERNAME|g; s|__ELASTICSEARCH_PASSWORD__|$ELASTICSEARCH_PASSWORD|g" ${KIBANA_CONFIG}/kibana.yml.tmpl > ${KIBANA_CONFIG}/kibana.yml
# cp ${KIBANA_CONFIG}/kibana.yml.tmpl ${KIBANA_CONFIG}/kibana.yml

##### 2 #####
#exec /usr/local/bin/kibana-docker
