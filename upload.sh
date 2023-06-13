#!/bin/bash

eval $(ssh-agent -s)
ssh-add /home/kube/.ssh/github
git status
git add .
git commit -m $1
git push -f
