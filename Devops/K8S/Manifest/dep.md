# Create Deployment file
````
vim dep.yaml
````
````
apiVersion: apps/v1
kind: Deployment
metadata:
  name: student-dep

spec:
   replicas: 5
   selector:
    matchLabels:
     app: studentapp

  
   template: 
     metadata:
       name: tmp-01
       labels:
         app: studentapp

     spec: 
      containers:
        - name: cont-1
          image: abhipraydh96/studentapp:v1
          ports:
          - containerPort: 80
---
apiVersion: v1
kind: Service 
metadata: 
   name: svc-student 
   
spec:
   selector:
      app: studentapp
   ports:
    - protocol: "TCP"
      port: 80
      targetPort: 80 
   type: NodePort
````


## apply deployment+svc file
````
kubectl apply -f dep.yaml
````

## check deployment 
````
kubectl get deploy -o wide
````
## rolling update
````
kubectl set image deploy/student-dep  cont-1=abhipraydh96/studentapp:v2
````
## rollout
````
kubectl rollout undo deploy/student-dep
````
