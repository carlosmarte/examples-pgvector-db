#!/usr/bin/env bash
set -euo pipefail

docker run --name pgvector-db \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d pgvector/pgvector:pg16

echo "pgvector-db started. Connect with:"
echo "  psql 'postgresql://postgres:mysecretpassword@localhost:5432/postgres'"
