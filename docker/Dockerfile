FROM docker.elastic.co/kibana/kibana:5.6.2

MAINTAINER Tim Taylor <ttaylor@mitre.org>

# kibana image for OpenShift 3 with the following properties:
#   	- runs under the restricted (default) Security Context Constraints
#       - Note that this image overrides the base image's CMD directive with custom ENTRYPOINT
#   	- runs without XPACK (kibana should not use XPACK if the ElasticSearch instance does not use it)
#
# base image specified at https://github.com/elastic/kibana-docker/blob/master/templates/Dockerfile.j2

EXPOSE 5601
USER 0

ENV KIBANA_HOME=/usr/share/kibana \
    KIBANA_CONFIG=/usr/share/kibana/config \
    KIBANA_VER=5.6.2

WORKDIR ${KIBANA_HOME}

COPY kibana.yml.tmpl ${KIBANA_CONFIG}
COPY *_container.sh ${KIBANA_HOME}/

RUN chown 1001:0 ${KIBANA_HOME} && \
    chown -R 1001:0 ${KIBANA_HOME}/{config,data,optimize} && \
    chown 1001:0 ${KIBANA_HOME}/*_container.sh && \
    chmod g+rwx ${KIBANA_HOME}{,/bin} && \
    chmod -R g+rw ${KIBANA_HOME}/{config,data,optimize}

USER 1001
ENTRYPOINT ["./start_container.sh"]
