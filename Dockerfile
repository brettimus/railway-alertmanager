FROM prom/alertmanager:v0.23.0
ADD prometheus.yml /etc/prometheus/
EXPOSE 9093
USER root