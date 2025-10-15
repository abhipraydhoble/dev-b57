## create configmap
````
vim conf.yaml
````
````
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-configmap
data:
  DB_URL: "mydbinstance.c6c8dfghilnt.us-east-1.rds.amazonaws.com"
  DB_USERNAME: "admin"
````
````
kubectl apply -f conf.yaml
````
---
````
vim dep1.yaml
````
````
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: app-container
          image: nginx
          envFrom:
            - configMapRef:
                name: my-configmap
````
````
kubectl apply -f dep1.yaml
````

````
kubectl get pods
````
````
kubectl describe pod <pod-name>
````
