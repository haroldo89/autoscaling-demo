# Deploy KNATIVE on Kubernetes in local environment

## Production (Non-)Suitability
Some values in this example **may or may not be optimal for your deployment**. 

## Pre-requisites

The example uses, targets or assumes:
 * [knative](https://knative.dev/docs/getting-started/quickstart-install/)
 * [Kind](https://github.com/kubernetes-sigs/kind) 
 * [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) 
 
## Quick Start

 * Create Kind cluster 
```
./knative-demo/cluster-local/cluster-knative.sh
```

* Deploy objects:
```
kubectl apply -k ./knative-demo/serving
```

* Clean up environment:
```
kubectl delete -k ./knative-demo/serving
```
