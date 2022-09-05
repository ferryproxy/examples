#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

KUBECONFIG=./kubeconfigs/cluster-0 kubectl exec "deploy/web-0" -- wget -q -T 1 -O- "web-1" | grep HOSTNAME
KUBECONFIG=./kubeconfigs/cluster-0 kubectl exec "deploy/web-0" -- wget -q -T 1 -O- "web-2" | grep HOSTNAME
