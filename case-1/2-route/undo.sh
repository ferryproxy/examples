#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete -f "${DIR}/route-policy.yaml"
