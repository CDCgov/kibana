#!/bin/bash
# 1. initializes container with ENV variables set by OpenShift templates:
#       - ${ELASTICSSEARCH_URL} -> elasticsearch.url
# 2. starts up kibana


##### 1 #####
mv ${KIBANA_CONFIG}/kibana.yml ${KIBANA_CONFIG}/kibana.yml.old
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g" ${KIBANA_CONFIG}/kibana.yml.tmpl > ${KIBANA_CONFIG}/kibana.yml

##### 2 #####
exec /usr/local/bin/kibana-docker
