FROM prom/blackbox-exporter:master

USER root

EXPOSE 9116

ENTRYPOINT [ "/bin/sh /entrypoint.sh" ]