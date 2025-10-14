#  Namespaces
- provide a mechanism for isolating groups of resources within a single cluster

## create namespace
````
kubectl create ns prod
````

## list namespace
````
kubectl get ns
````

## create pod in prod ns
````
kubectl run pod-1 --image=nginx  -n prod
````
## list pod inside prod ns
````
kubectl get pod -n prod
````
---
## switch namespace
````
kubectl config set-context --current --namespace=prod
````
## check current namespace
````
kubectl config view --minify | grep namespace:
````
---
## create ns using yaml
````
# namespace
apiVersion: v1 
kind: Namespace
metadata: 
  name: staging
````

## create pod
````
apiVersion: v1 
kind: Pod
metadata: 
  name: pod-blue
  namespace: staging
  labels: 
    app: blue
spec: 
  containers:
   - name: c1 
     image: abhipraydh96/blue 
     ports:
     - containerPort: 80
````
````
kubectl get pod -n staging
````
