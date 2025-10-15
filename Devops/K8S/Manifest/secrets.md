# create secret
````
vim  secret.yaml
````
````
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
type: Opaque
data:
  DB_PASSWORD: UGFzc3dvcmRAMTIz # Base64 encoded value of "password"
````
---
## create deployment
````
vim dep2.yaml
````
````
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dep-2
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
          env:
            - name: DB_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: app-secrets
                  key: DB_PASSWORD
````
````
kubectl apply -f secret.yaml
kubectl apply -f dep2.yaml
kubectl get pod
kubectl describe pod <pod-name>
````
