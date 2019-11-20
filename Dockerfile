FROM prom/blackbox-exporter:master

USER root
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 9116

ENTRYPOINT [ "/entrypoint.sh" ]