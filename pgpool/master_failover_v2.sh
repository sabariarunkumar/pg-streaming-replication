
### Sample

stat_file=$1

export PGPASSWORD="c1sco@4%31"
#Promote standby
# Hardcoding standby details for testing purposes

psql -U cisco -h 10.81.1.196 -p 6432 -c "select pg_promote()";

touch $stat_file
echo "failed_node_id=$2" > $stat_file
echo "primary_node=$3" >> $stat_file

exit 0;