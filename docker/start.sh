#!/bin/sh

set -x

npx prisma migrate deploy --schema ../../packages/prisma/schema.prisma

# Try to find the correct server build file
if [ -f "build/server/index.js" ]; then
    echo "Starting server with build/server/index.js"
    HOSTNAME=0.0.0.0 node build/server/index.js
elif [ -f "build/index.js" ]; then
    echo "Starting server with build/index.js"
    HOSTNAME=0.0.0.0 node build/index.js
else
    echo "Error: Could not find server build file"
    echo "Contents of build directory:"
    ls -la build/ || echo "build directory not found"
    echo "Contents of current directory:"
    ls -la ./
    exit 1
fi