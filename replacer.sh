#!/bin/bash

file_name="values.properties"

if [ -f "$file_name" ]; then
  while IFS="\n" read -r line
  do
    key=$(echo "$line" | cut -d '=' -f 1)
    value=$(echo "$line" | cut -d '=' -f 2)
    sudo sed -i "s/$key/$value/g" /tmp/tmp.yaml  #asked sudo passward
  done < $file_name
else
fi
