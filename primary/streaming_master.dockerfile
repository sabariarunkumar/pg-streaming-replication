FROM postgres:latest

LABEL maintainer="sabari"

COPY ./pg_hba.conf /etc/postgresql/
COPY ./postgresql.conf /etc/postgresql/
COPY ./init_replication_slot_creation.sh /docker-entrypoint-initdb.d/

EXPOSE 5432

ENV PGDATA=/var/lib/postgresql/data/pgdata
# These values should come from secret either using docker swarm's secret or any properitary secret manager

ENV POSTGRES_USER=cisco
ENV POSTGRES_PASSWORD=c1sco@4%31
