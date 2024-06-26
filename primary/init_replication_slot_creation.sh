#!/bin/bash
set -e

# Let us create replication user, which will be used by slaves. Alse let us create replication_slot proprtional to number of standby servers for acheving concurreny.
# In future if new standby servers be added, then cluster agent will need to explicitly exectute sql command: SELECT * FROM pg_create_physical_replication_slot('standby_n_slot');
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER replicator REPLICATION LOGIN ENCRYPTED PASSWORD 'ciscoreplLogin123';
	SELECT * FROM pg_create_physical_replication_slot('standby_1_slot');
    SELECT * FROM pg_create_physical_replication_slot('standby_2_slot');
EOSQL