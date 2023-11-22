#!/bin/bash
template_file_path=/root/script/template

# Initialize an array to store values
values=()

while true;
 do
  # Enter user for a value
  echo "Enter a value (or type 'end' to finish):"
  read val

  # Check  the enter user wants to end
  if [ "$val" == "end" ]; then
    break
  fi

  # Add the value to the array
  values+=("$val")
done

# Loop through each value
for val in "${values[@]}"; do
  # Replace the line in the original content
  updated_content=$(cat ${template_file_path}/bp.service.yml | sed "s/name: cardgatewayservice-java/name: $val/")

  # Create a new YAML file with the updated content
  echo "$updated_content" > "file_$val.yaml"
done
