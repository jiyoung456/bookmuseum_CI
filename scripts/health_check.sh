#!/bin/bash
set -e

URL="http://localhost:8080/actuator/health"
echo "Checking health: $URL"

for i in {1..24}; do
  if curl -fsS "$URL" > /dev/null; then
    echo "Health OK"
    exit 0
  fi
  echo "Waiting for app... ($i/24)"
  sleep 5
done

echo "Health FAILED (last response):"
curl -i "$URL" || true
exit 1
