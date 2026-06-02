# Example 1 — `docker run`

The quickest way to get pgvector running. Uses the prebuilt `pgvector/pgvector:pg16`
image (Postgres 16 with the extension already compiled in).

## Run

```bash
./run.sh
# or directly:
docker run --name pgvector-db \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d pgvector/pgvector:pg16
```

## Verify

```bash
psql "postgresql://postgres:mysecretpassword@localhost:5432/postgres" \
  -c "CREATE EXTENSION IF NOT EXISTS vector;" \
  -c "SELECT '[1,2,3]'::vector;"
```

## Stop & remove

```bash
docker stop pgvector-db && docker rm pgvector-db
```

> Note: no volume is mounted here, so data is lost when the container is removed.
> For persistence use [Example 2](../02-docker-compose).
