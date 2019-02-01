#!/bin/bash

echo "123123123"

kubectl config set-cluster k8s --insecure-skip-tls-verify=true --server=$K8S_API_URL &&
kubectl config set-credentials ci --token=$K8S_CI_TOKEN &&
kubectl config set-context ci --cluster=k8s --user=ci &&
kubectl config use-context ci
kubectl config view

ls -al /github/workspace/
