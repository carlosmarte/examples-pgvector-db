# Example 3 — Build the extension yourself

Starts from the official `postgres:16` image and installs `postgresql-16-pgvector`
from apt. Use this when you want to pin or patch the build rather than depend on
the upstream `pgvector/pgvector` image.

## Build

```bash
docker build -t my-pgvector .
```

## Run

```bash
docker run --name pgvector-db \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d my-pgvector
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

> Heads-up: the `postgres:16` base image carries OS-level CVEs over time. Rebuild
> periodically (`docker build --pull`) to pick up upstream patches, or pin a digest
> for reproducibility.
