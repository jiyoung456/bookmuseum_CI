#!/bin/bash
set -e

# /opt/a086195 디렉토리 보장
mkdir -p /opt/a086195

# jar 위치 찾기 (CodeBuild artifact 기준: build/libs/*.jar)
JAR=$(ls -1 /opt/a086195/build/libs/*.jar 2>/dev/null | head -n 1 || true)

# 만약 destination 아래에 build/libs가 아니라 루트로 떨어졌다면(상황별로 다를 수 있어) 대비
if [ -z "$JAR" ]; then
  JAR=$(ls -1 /opt/a086195/*.jar 2>/dev/null | head -n 1 || true)
fi

if [ -z "$JAR" ]; then
  echo "Jar not found under /opt/a086195"
  ls -al /opt/a086195 || true
  exit 1
fi

echo "$JAR" > /opt/a086195/current_jar_path
