#!/bin/bash
set -e

# 앱이 떠서 8080이 열렸는지 확인
sleep 5
curl -fsS http://localhost:8080/actuator/health >/dev/null 2>&1 || curl -fsS http://localhost:8080/ >/dev/null
