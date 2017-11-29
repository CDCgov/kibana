#!/bin/bash
# prints out information that is useful for debugging container


echo "ElaticSearch and proxy environment variables..."
set | grep ELASTIC
set | grep proxy

echo "verify ElasticSearch is running at ${ELASTICSEARCH_URL}..."
curl -XGET ${ELASTICSEARCH_URL}

echo "show configs..."
cat ${KIBANA_CONFIG}/kibana.yml

#echo "adding a single document to ${ELASTICSEARCH_URL}/test/ index"
#curl -XPUT ${ELASTICSEARCH_URL}/test/external/1 -H 'Content-Type: application/json' -d'{"name": "ocp-kibana container test"}'
