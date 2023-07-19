#!/bin/bash

kustomize build . > /tmp/tmp.yaml

file_name="values.properties"

while IFS="\n" read -r line
  do
    key=$(echo "$line" | cut -d '=' -f 1)
    value=$(echo "$line" | cut -d '=' -f 2)
    sed -i "s/$key/$value/g" /tmp/tmp.yaml  #asked sudo password
done < $file_name

argocd-vault-plugin generate /tmp/tmp.yaml
