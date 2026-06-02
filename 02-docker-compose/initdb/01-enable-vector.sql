-- Enable the pgvector extension on first database initialization.
-- Files in /docker-entrypoint-initdb.d run once when the data volume is empty.
CREATE EXTENSION IF NOT EXISTS vector;
