#!/bin/bash

kustomize build . > /tmp/tmp.yaml

file_name="values.properties"

argocd-vault-plugin generate /tmp/tmp.yaml
