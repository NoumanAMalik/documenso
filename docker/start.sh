#!/usr/bin/env sh
set -e

# 1. Run all pending Prisma migrations
npx prisma migrate deploy --schema ../../packages/prisma/schema.prisma

# 2. Start your Node.js server, listening on Railway’s $PORT and 0.0.0.0
#    - exec replaces the shell with the node process so SIGTERM/SIGINT get forwarded.
exec node build/server/main.js --port "$PORT" --host "0.0.0.0"