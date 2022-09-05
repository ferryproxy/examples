#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

for _ in $(seq 1 6); do
  KUBECONFIG=./kubeconfigs/cluster-0 kubectl exec "deploy/web-0" -- wget -q -T 1 -O- "web-lb" | grep HOSTNAME
done
