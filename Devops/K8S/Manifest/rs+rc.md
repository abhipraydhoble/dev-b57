## ReplicationController
````
apiVersion: v1 
kind: ReplicationController
metadata: 
  name: rc-01
spec: 
 replicas: 3
 selector:
   app: demo 

 template: 
  metadata: 
   name: temp-01 
   labels: 
     app: demo
  spec:
   containers:
    - name: c1
      image: nginx 
      ports:
      - containerPort: 80
````
````
kubectl apply -f rc.yaml
````
````
kubectl get rc
````
````
kubectl get pods
````


## ReplicaSet
````
apiVersion: aaps/v1 
kind: ReplicaSet
metadata: 
  name: rs-test
spec: 
 replicas: 3
 selector:
  matchLabels:
   app: test 

 template: 
  metadata: 
   name: temp-01 
   labels: 
     app: test
  spec:
   containers:
    - name: c1
      image: nginx 
      ports:
      - containerPort: 80
````
