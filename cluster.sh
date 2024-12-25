#!/bin/bash
kubectl version
#set the kubeconfig file
KUBECONFIG=kube_custom.config

#create the first cluster "development"
kubectl config set-cluster development \
  --server=https://0.0.1.1 \
  --certificate-authority=temp_ca_file \
  --kubeconfig=$KUBECONFIG

#create the second cluster "staging"
kubectl config set-cluster staging \
  --server=https://5.6.7.8 \
  --certificate-authority=temp_ca_file \
  --kubeconfig=$KUBECONFIG

#set context to "dev-frontend"
kubectl config set-context dev-frontend \
  --cluster=development \
  --namespace=frontend \
  --user=developer \
  --kubeconfig=$KUBECONFIG

#set context to "dev-staging"
kubectl config set-context dev-staging \
  --cluster=staging \ 
  --namespace=frontend \
  --user=developer \
  --kubeconfig=$KUBECONFIG

kubectl config view --kubeconfig=$KUBECONFIG
