FROM prom/alertmanager:v0.23.0
ADD alertmanager.yml /config
ADD alertmanager.yml /etc/alertmanager
EXPOSE 9093
USER root