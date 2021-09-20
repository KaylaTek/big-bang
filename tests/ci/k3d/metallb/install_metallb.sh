#!/usr/bin/env bash

set -ex

if [[ $CI_MERGE_REQUEST_LABELS =~ "keycloak" ||  $CI_MERGE_REQUEST_LABELS =~ "all-packages" ]]; then
  kubectl create -f tests/ci/k3d/metallb/metallb.yaml
  kubectl create -f tests/ci/k3d/metallb/metallb-config.yaml
else
 echo "Keycloak not present, Metallb will not be install"
fi