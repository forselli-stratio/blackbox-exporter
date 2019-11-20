# Blackbox-exporter
blackbox-exporter ready to deploy in dc/os.
It has only the dns module configured, if you want to add or modify the module edit this part in the entrypoint.sh file:

```
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
