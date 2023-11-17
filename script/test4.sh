#!/bin/bash

# Define template file paths
SERVICE_TEMPLATE="/root/script/template/bp.service.yml"
SERVICE_ENV_TEMPLATE="/root/script/template/bp.service_env.yml"
CD_TEMPLATE="/root/script/template/bp.cd.yml"

while true; do
    echo "Enter a service name (type 'finish' or 'end' to stop):"
    read user_input

    if [ "$user_input" == "finish" ] || [ "$user_input" == "end" ]; then
        echo "Script terminated."
        break
    fi

    # Create filenames based on user input
    SERVICE_FILE="${user_input}_service.yaml"
    SERVICE_ENV_FILE="${user_input}_service_env.yaml"
    CD_FILE="${user_input}_cd.yaml"

    # Replace placeholders in templates and create files
    sed "s/cardgatewayservice-java/${user_input}/g" "$SERVICE_TEMPLATE" > "$SERVICE_FILE"
    sed "s/cardgatewayservice-java/${user_input}/g" "$SERVICE_ENV_TEMPLATE" > "$SERVICE_ENV_FILE"
    sed "s/cardgatewayservice-java/${user_input}/g" "$CD_TEMPLATE" > "$CD_FILE"

    echo "Files created for ${user_input}"
done








