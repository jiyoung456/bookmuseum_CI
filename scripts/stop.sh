#!/bin/bash
set +e

if [ -f /opt/a086195/app.pid ]; then
  PID=$(cat /opt/a086195/app.pid)
  kill "$PID" 2>/dev/null
  sleep 5
  kill -9 "$PID" 2>/dev/null
  rm -f /opt/a086195/app.pid
fi
