#!/bin/bash
# Allows to install Metrics Server Addon inside a local kubernetes cluster.
# Arguments:
#   None
#######################################


#######################################
# Apply CRD that install Metrics Server Addon inside kubernetes cluster
# Globals:
#   None
# Arguments:
#   None
#######################################
function installMetricServer() {
  kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
}

#######################################
# Patch metrics-server deployment with kubelet-insecure-tls only for local environment purpose
# Globals:
#   None
# Arguments:
#   None
#######################################
function patchMetricServerForLocalEnvironment(){
  kubectl patch -n kube-system deployment metrics-server --type=json \
  -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
}

#######################################
# Install and patch Metrics-Server component in a local kubernetes cluster
# Globals:
#   None
# Arguments:
#   None
#######################################
function main() {
  installMetricServer
  patchMetricServerForLocalEnvironment
}

main
