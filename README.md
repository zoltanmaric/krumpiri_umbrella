# Krumpiri

## Installation
### Set up PostgreSQL, the DB containing user info
TODO

### Set up Cassandra, where readings are stored
```bash
# Start or pull a new Cassandra docker container
docker run --name krumpiri-cassandra -d cassandra:3.11.2

# Start a cql shell in another container
docker run -it --link krumpiri-cassandra:cassandra --rm cassandra:3.11.2 sh -c 'exec cqlsh "$CASSANDRA_PORT_9042_TCP_ADDR"'
```

```sql
-- Create a keyspace for the app
create keyspace Krumpiri with replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- create tables
CREATE TABLE readings (
  id UUID PRIMARY KEY,
  net_in_wh INT,
  read_time TIMESTAMP,
  signature TEXT,
  username TEXT
);
```
