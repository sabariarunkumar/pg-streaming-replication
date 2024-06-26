
### Sample

stat_file=$1

# login in to one of standby docker container and promote
# Hardcoding standby details for testing purposes
sshpass -p 'remote_user' ssh -tt -o StrictHostKeyChecking=no  remote_user@10.81.1.196 'sshpass -p 'remote_user' sudo docker exec -u postgres  postgresql-standby 'pg_ctl promote -D /var/lib/postgresql/data/pgdata''

touch $stat_file
echo "failed_node_id=$2" > $stat_file
echo "primary_node=$3" >> $stat_file

exit 0;