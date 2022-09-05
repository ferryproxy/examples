#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete -n ferry-system --all routepolicies.traffic.ferryproxy.io
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete -n ferry-system --all routes.traffic.ferryproxy.io
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete -n ferry-system --all hubs.traffic.ferryproxy.io
sleep 2
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete ns ferry-system
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete ns ferry-tunnel-system
KUBECONFIG=./kubeconfigs/cluster-1 kubectl delete ns ferry-tunnel-system
KUBECONFIG=./kubeconfigs/cluster-2 kubectl delete ns ferry-tunnel-system

KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete crd hubs.traffic.ferryproxy.io 
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete crd routepolicies.traffic.ferryproxy.io 
KUBECONFIG=./kubeconfigs/cluster-0 kubectl delete crd routes.traffic.ferryproxy.io 
