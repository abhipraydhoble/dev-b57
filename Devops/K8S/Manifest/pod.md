# How to create pod+svc in k8s using imperative way

````
kubectl run gym-pod --image=abhipraydh96/gym
````
````
kubectl expose pod gym-pod --port=80 --target-port=80 --type=ClusterIP
````

# How to create pod+svc in k8s using declarative way

### create yaml file to create pod
````
apiVersion: v1
kind: Pod 
metadata:
  name: gym-pod
  labels:
    app: fitnessapp
spec:
  containers:
    - name: gym-cont
      image: abhipraydh96/gym
      ports:
        - containerPort: 80
````
### apply script
````
kubectl apply -f pod.yaml
````
### create yaml file to create service
````
vim service.yaml
````
````
apiVersion: v1
kind: Service
metadata:
  name: svc-gym
spec:
  selector:
     app: fitnessapp
  ports:
   - protocol: "TCP"
     port: 80
     targetPort: 80
  type: NodePort
````
### apply script
````
kubectl apply -f service.yaml
````
