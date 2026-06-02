# Example 2 — Docker Compose (recommended)

Same prebuilt `pgvector/pgvector:pg16` image as Example 1, but with:

- a **named volume** so data survives restarts,
- a **healthcheck** (`pg_isready`),
- an **init script** that enables the `vector` extension automatically on first boot,
- **env-driven** credentials/port via `.env`.

## Run

```bash
cp .env.example .env   # optional — edit credentials/port
docker compose up -d
```

## Verify

```bash
psql "postgresql://myuser:mysecretpassword@localhost:5432/mydatabase" \
  -c "SELECT '[1,2,3]'::vector;"
```

## Stop

```bash
docker compose down       # keep data
docker compose down -v    # delete the data volume too
```

## Config defaults (`.env.example`)

| Variable            | Default            |
| ------------------- | ------------------ |
| `POSTGRES_USER`     | `myuser`           |
| `POSTGRES_PASSWORD` | `mysecretpassword` |
| `POSTGRES_DB`       | `mydatabase`       |
| `POSTGRES_PORT`     | `5432`             |
