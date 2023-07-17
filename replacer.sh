#!/bin/bash

kustomize build . > /tmp/tmp.yaml

file_name="values.properties"

if [ -f "$file_name" ]; then
  echo "The file $file_name exists."
  while IFS="\n" read -r line
  do
    echo $line
    key=$(echo "$line" | cut -d '=' -f 1)
    value=$(echo "$line" | cut -d '=' -f 2)
    sed -i "s/$key/$value/g" /tmp/tmp.yaml  #asked sudo password
  done < $file_name
else
  echo "The file $file_name does not exist."
fi

argocd-vault-plugin generate /tmp/tmp.yaml > /tmp/result.yaml
