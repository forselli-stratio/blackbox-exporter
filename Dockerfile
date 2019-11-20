FROM prom/blackbox-exporter:master

USER root
ADD config.yml /etc/blackbox_exporter/config.yml

EXPOSE 9116

ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml","--web.listen-address=:9116" ]