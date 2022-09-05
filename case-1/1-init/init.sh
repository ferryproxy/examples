#!/usr/bin/env bash

DIR="$(dirname "${BASH_SOURCE[0]}")"
ROOT="${DIR}/.."

cd "${ROOT}"

echo
echo ==== Init Control Plane =======================================
KUBECONFIG=./kubeconfigs/cluster-0 ferryctl control-plane init
echo =======================================

echo
echo ==== Init Data Plane =======================================
KUBECONFIG=./kubeconfigs/cluster-1 ferryctl data-plane init
echo =======================================
KUBECONFIG=./kubeconfigs/cluster-2 ferryctl data-plane init
echo =======================================

echo
echo ==== Join Data Plane =======================================
KUBECONFIG=./kubeconfigs/cluster-0 FERRY_PEER_KUBECONFIG=./kubeconfigs/cluster-1 ferryctl control-plane join cluster-1
echo =======================================
KUBECONFIG=./kubeconfigs/cluster-0 FERRY_PEER_KUBECONFIG=./kubeconfigs/cluster-2 ferryctl control-plane join cluster-2
echo =======================================
