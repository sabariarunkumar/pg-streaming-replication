FROM haproxy:latest
USER root
RUN apt-get update && apt-get install -y postgresql-client
USER haproxy