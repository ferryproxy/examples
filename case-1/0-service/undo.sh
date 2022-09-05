#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete -f "${DIR}/service-0.yaml"
KUBECONFIG=./kubeconfigs/cluster-1 kubectl delete -f "${DIR}/service-1.yaml"
KUBECONFIG=./kubeconfigs/cluster-2 kubectl delete -f "${DIR}/service-2.yaml"

