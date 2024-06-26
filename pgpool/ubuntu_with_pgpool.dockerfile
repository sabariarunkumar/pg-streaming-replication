FROM ubuntu:20.04
RUN apt-get update && apt-get install -y pgpool2 \ && apt-get install -y vim && apt-get install -y postgresql-client
ENTRYPOINT ["tail -f /var/log/*.log"]