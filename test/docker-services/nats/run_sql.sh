#!/usr/bin/env bash
# Скрипт для запуска SQL скриптов для текущего окружения
export $(cat .env | xargs)
docker exec -it nats-postgres psql -d ${POSTGRES_DB} -U ${POSTGRES_USER}