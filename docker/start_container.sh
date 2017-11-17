#!/bin/bash
# 1. initializes container with ENV variables set by OpenShift templates:
#       - ${ELASTICSSEARCH_URL} -> elasticsearch.url
# 2. starts up kibana


##### 1 #####
mv ${KIBANA_CONFIG}/kibana.yml ${KIBANA_CONFIG}/kibana.yml.old
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g" ${KIBANA_CONFIG}/kibana.yml.tmpl > ${KIBANA_CONFIG}/kibana.yml

#debug output to verify/debug deployment environment
if [ "$OCP_DEBUG_CONTAINER" = 1 ]; then
    exec ${KIBANA_HOME}/debug_container.sh
fi

##### 2 #####
exec /usr/local/bin/kibana-docker
