# Start from the official PostgreSQL image
FROM postgres:16

# Install the pgvector extension via apt
RUN apt-get update && \
    apt-get install -y postgresql-16-pgvector && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
