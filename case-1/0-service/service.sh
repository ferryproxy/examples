#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

echo
echo ==== Deployment Services =======================================
KUBECONFIG=./kubeconfigs/cluster-0 kubectl apply -f "${DIR}/service-0.yaml"
echo =======================================
KUBECONFIG=./kubeconfigs/cluster-1 kubectl apply -f "${DIR}/service-1.yaml"
echo =======================================
KUBECONFIG=./kubeconfigs/cluster-2 kubectl apply -f "${DIR}/service-2.yaml"
echo =======================================
