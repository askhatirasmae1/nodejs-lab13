#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./rollback.sh <commit_hash>"
  exit 1
fi

COMMIT=$1

cd /var/www/mon-app

if ! git cat-file -e $COMMIT; then
  echo "Le commit $COMMIT n'existe pas"
  exit 1
fi

cp .env .env.backup

git checkout $COMMIT

cp .env.backup .env

npm ci

pm2 reload ecosystem.config.js

echo "Rollback vers le commit $COMMIT effectué avec succès"