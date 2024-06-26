Streaming Replication Master [Non archival mode with async]:
    Docker Build command (s):
        docker pull postgres:latest
        docker build -t postgresql-streaming-master:latest  . -f streaming_master.dockerfile
    Docker Run command:
        docker run -p 6432:5432 --name postgresql-master -v /home/ubuntu/sabari/postgresql/master/container-data:/var/lib/postgresql/data -d postgresql-streaming-master -c 'config_file=/etc/postgresql/postgresql.conf' -c 'hba_file=/etc/postgresql/pg_hba.conf'