#!/bin/bash

ENVIRONMENT="${environment}"

echo "Running in $ENVIRONMENT environment"

if [ "$ENVIRONMENT" = "dev" ]; then
  APP_PORT=8080
  APP_NAME="MyApp-DEV"
elif [ "$ENVIRONMENT" = "stg" ]; then
  APP_PORT=8081
  APP_NAME="MyApp-STG"
else
  APP_PORT=80
  APP_NAME="MyApp-PROD"
fi

echo "APP_NAME=$APP_NAME" >> /etc/environment
echo "APP_PORT=$APP_PORT" >> /etc/environment
