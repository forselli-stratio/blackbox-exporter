#!/bin/bash
cat <<EOF > /config.yml
modules:
  dns_tcp:
    prober: dns
    dns:
      transport_protocol: "tcp" # defaults to "udp"
      preferred_ip_protocol: "ip4" # defaults to "ip6"
      query_name: ${QUERY_NAME}
EOF

/usr/local/bin/blackbox_exporter --config.file /config.yml --web.listen-address=:9116