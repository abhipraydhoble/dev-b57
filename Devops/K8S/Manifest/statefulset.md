<img width="955" height="363" alt="image" src="https://github.com/user-attachments/assets/b0e690b5-1ea8-40ac-8a29-0a1fc2f47d61" />

````
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: redis
spec:
  serviceName: "redis"
  replicas: 3
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
      - name: redis
        image: redis:5.0.5
        ports:
        - containerPort: 6379
          name: redis
  volumeClaimTemplates:
  - metadata:
      name: redis-data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
````
````
kubectl apply sts.yaml
````
````
kubectl get pods
````
