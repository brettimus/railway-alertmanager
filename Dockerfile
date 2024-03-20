# Stage 1: Use a temporary image to use envsubst on the alertmanager config
FROM alpine:3.12 as builder

RUN apk add --no-cache gettext
WORKDIR /workspace
COPY alertmanager.yml /workspace/alertmanager.yml.template
# Replace the environment variable placeholder in the template file
ARG PAGERDUTY_SERVICE_KEY
RUN envsubst '${PAGERDUTY_SERVICE_KEY}' < alertmanager.yml.template > alertmanager.yml

# Stage 2: Use the final image
FROM prom/alertmanager:v0.23.0
USER root
COPY --from=builder /workspace/alertmanager.yml /etc/alertmanager/alertmanager.yml
EXPOSE 9093
