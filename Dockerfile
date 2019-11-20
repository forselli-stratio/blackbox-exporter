FROM prom/blackbox-exporter:master

USER root
ADD config.yml /etc/blackbox_exporter/config.yml
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
