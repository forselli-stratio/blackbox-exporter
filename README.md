# Blackbox-exporter
blackbox-exporter ready to deploy in dc/os.
It has only the dns module configured, if you want to add or modify the module edit this part in the entrypoint.sh file:

```yaml
modules:
  dns_tcp:
    prober: dns
    dns:
      transport_protocol: "tcp" # defaults to "udp"
      preferred_ip_protocol: "ip4" # defaults to "ip6"
      query_name: ${QUERY_NAME}
```

| Variable | Definition |
|-------------------|:--------------|
| QUERY_NAME    | Name you want to query to test DNS resolution        |

Add the following configuration to your prometheus.yml file to scrape blackbox-exporter metrics
```yaml
  - job_name: 'blackbox-dns'
    scrape_interval: 60s
    metrics_path: /probe
    params:
      module: ['dns_tcp']
    file_sd_configs:        
    - files: ['/etc/prometheus/external_dns_nodes.json']
  # Targets to probe
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: blackbox-exporter.exporters.marathon.mesos:9116
```