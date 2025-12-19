#!/bin/bash
set -e

JAR=$(cat /opt/a086195/current_jar_path)

# 백그라운드 실행 + 로그 파일
nohup java -jar "$JAR" --server.port=8080 > /var/log/a086195-backend.log 2>&1 &
echo $! > /opt/a086195/app.pid
