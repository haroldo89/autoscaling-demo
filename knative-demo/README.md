# Deploy KNATIVE on Kubernetes in local environme

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
./knative-demo/cluster-local/cluster-keda.sh
```

* Deploy objects:
```
kubectl apply -k ./keda-demo
```

### Persistent Volumes

`Kind` by default creates a [storage class](https://kubernetes.io/docs/concepts/storage/storage-classes/) called `standard`
```
kubectl get storageclass
NAME                 PROVISIONER               AGE
standard (default)   kubernetes.io/host-path   5h
```


* Clean up environment:
```
kubectl delete -k ./keda-demo
```
