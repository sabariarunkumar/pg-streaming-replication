
### Sample

stat_file=$1

# login in to standby docker container and update sync details
# Hardcoding new primary details for testing purposes
sshpass -p 'remote_user' ssh -tt -o StrictHostKeyChecking=no  remote_user@10.81.1.196 'sshpass -p 'remote_user' sudo docker exec -u postgres  postgresql-standby 'sed -i -E "s/^(primary_conninfo\s*=\s*').*/primary_conninfo = 'host=$2 port=$3 user=replicator password=ciscoreplLogin123'/" /etc/postgres/postgresql.conf pg_ctl reload -D /var/lib/postgresql/data/pgdata''

touch $stat_file
echo "failed_node_id=$2" > $stat_file
echo "primary_node=$3" >> $stat_file

exit 0;