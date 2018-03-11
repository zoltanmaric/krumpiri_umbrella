# Krumpiri

## Installation
### Set up PostgreSQL, the DB containing user info
TODO

### Set up Cassandra, where readings are stored
```bash
# Create a new named Cassandra docker container
docker run --name krumpiri-cassandra -d -p 9042:9042 cassandra:3.11.2

# Start a cql shell in another container
docker run -it --link krumpiri-cassandra:cassandra --rm cassandra:3.11.2 sh -c 'exec cqlsh "$CASSANDRA_PORT_9042_TCP_ADDR"'
```

```sql
-- Create a keyspace for the app
create keyspace Krumpiri with replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- create tables
use Krumpiri;
CREATE TABLE readings (
  id UUID PRIMARY KEY,
  net_in_wh INT,
  read_time TIMESTAMP,
  signature TEXT,
  username TEXT
);
```

```bash
# When done, stop the container
docker stop krumpiri-cassandra

# Later you can start your named container with
docker start krumpiri-cassandra
```
