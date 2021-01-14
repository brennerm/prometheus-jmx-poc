# Prometheus JMX PoC

This repo contains an example application and all the necessary configuration to showcase how to monitor Java process metrics using JMX, Prometheus and Grafana.

Execute `docker-compose up` and access the Grafana dashboard at `http://localhost:3000/d/chanjarster-jvm-dashboard/jvm-dashboard` afterwards.

Below you can find a list of all relevant files/folders:

- javaagent-config.yaml: configuration file for the Prometheus JMX Exporter agent
- prometheus.yml: configuration file for Prometheus
- provisioning: contains the initial configuration for Grafana
- src: contains the code of the example Java application
- jmx-dashboard.json: specification of the JMX Grafana dashboard (based on [this dashboard](https://grafana.com/grafana/dashboards/8563))
- docker-compose.yml: Docker Compose file putting everything together
