FROM prom/alertmanager:v0.23.0
ADD alertmanager.yml /config
EXPOSE 9093
USER root