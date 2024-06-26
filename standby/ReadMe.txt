Streaming Replication Standby [Non archival mode, asyn replication]:
    Update with primary server's pg_data in currect standby node/host's mount location:
        * install postgresql-16-client system package
        * Run the comment:
            pg_basebackup -h 10.81.1.194 -p 6432 -D  /home/ubuntu/sabari/postgresql/standby/container-data/pgdata/ -U replicator -P -v
    Update pg_data with standby.signal file to make it run in standby mode:
        * cp ./standby.signal  /home/ubuntu/sabari/postgresql/standby/container-data/pgdata/
    Docker Build command (s):
        docker pull postgres:latest
        docker build -t postgresql-streaming-standby:latest  . -f streaming_standby.dockerfile
    Docker Run command:
        docker run -p 6432:5432 --name postgresql-standby -v /home/ubuntu/sabari/postgresql/standby/container-data:/var/lib/postgresql/data -d postgresql-streaming-standby -c 'config_file=/etc/postgresql/postgresql.conf' -c 'hba_file=/etc/postgresql/pg_hba.conf'
