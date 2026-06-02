# examples-pgvector-db

Three self-contained examples of running [pgvector](https://github.com/pgvector/pgvector)
(Postgres + vector similarity search) in Docker. Each lives in its own folder with
its own README.

| Folder | Approach | Persistence | Best for |
| ------ | -------- | ----------- | -------- |
| [`01-docker-run`](./01-docker-run) | One-liner `docker run` with the prebuilt image | ❌ ephemeral | Quick throwaway testing |
| [`02-docker-compose`](./02-docker-compose) | Compose: volume + healthcheck + auto-enabled extension | ✅ named volume | **Recommended** local dev |
| [`03-dockerfile-build`](./03-dockerfile-build) | Build your own from `postgres:16` + apt | ❌ ephemeral | Custom/pinned builds |

All three expose Postgres on `localhost:5432`. Run only one at a time (they share
the container name `pgvector-db` and the host port).

## Quick start

```bash
cd 02-docker-compose
docker compose up -d
psql "postgresql://myuser:mysecretpassword@localhost:5432/mydatabase" \
  -c "SELECT '[1,2,3]'::vector;"
```

See each folder's README for details.
