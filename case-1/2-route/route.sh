#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

echo ==== Apply Route =======================================
KUBECONFIG=./kubeconfigs/cluster-0 kubectl apply -f "${DIR}/route-policy.yaml"
echo =======================================
