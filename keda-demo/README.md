# Deploy KEDA on Kubernetes in local environment

## Production (Non-)Suitability
Some values in this example **may or may not be optimal for your deployment**. 

## Pre-requisites

The example uses, targets or assumes:

 * [Kind](https://github.com/kubernetes-sigs/kind) 
 * [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) 
 
## Quick Start

 * Create Kind cluster 
```
./keda-demo/cluster-local/cluster-keda.sh
```

* Deploy objects:
```
kubectl apply -k ./keda-demo
```

## Details

_kind is a tool for running local Kubernetes clusters using Docker container "nodes"._
Kind should be used only for developing or/and for CI integration.

### Port Mapping
The `kind-cluster.yaml` configuration binds localhost ports:

```yaml
 extraPortMappings:
  - containerPort: 31672
    hostPort: 15673
  - containerPort: 30672
    hostPort: 5673
  - containerPort: 30808
    hostPort: 8080
  
```

The `NodePort` service exposes the ports: 
```yaml
spec:
  type: NodePort
  ports:
    - name: http
      protocol: TCP
      port: 15672
      targetPort: 15672
      nodePort: 31672  # <---- binds the extraPortMappings.containerPort 31672
    - name: amqp
      protocol: TCP
      port: 5672
      targetPort: 5672
      nodePort: 30672  # <---- binds the extraPortMappings.containerPort 30672
    - name: nginx
      protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30808  # <---- binds the extraPortMappings.containerPort 30672

```

So in this way you can easly use the localhost ports.

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
