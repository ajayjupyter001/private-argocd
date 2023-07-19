#!/bin/bash

kustomize build . > /tmp/tmp.yaml

file_name="values.properties"

sed -i "s/containername/ashwin/g" /tmp/tmp.yaml

argocd-vault-plugin generate /tmp/tmp.yaml
