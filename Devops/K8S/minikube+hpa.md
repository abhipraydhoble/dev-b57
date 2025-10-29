
## Minikube Installation on AWS EC2

## Step 1: Create an AWS EC2 instance with Ubuntu 22
Instance Size: t2.large with 2 CPUs, 32 GB Storage

## Step 2 : Install Docker
````
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
````
## Install kubectl
Download the latest release with the command:
````
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
````

Install kubectl:
````
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
````
Note:
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
````
````
kubectl version --client
````
## Step 4: Install Minikube
````
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
````
````
sudo install minikube-linux-amd64 /usr/local/bin/minikube
````
````
minikube start
````
````
minikube stop
````


--------------------------------------------



# HPA with Minikube

#  make sure your minikube cluster is running

# enable metrics-server
````
minikube addons enable metrics-server
````

# create deployment 
````
vim hpa-dep.yaml
````

````
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hpa-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hpa-nginx
  template:
    metadata:
      labels:
        app: hpa-nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        resources:
          requests:
            cpu: "100m"
          limits:
            cpu: "200m"
        ports:
        - containerPort: 80
````
````
kubectl apply -f hpa-dep.yaml
````

---
# create service.yaml
````
apiVersion: v1
kind: Service
metadata:
  name: hpa-service
spec:
  selector:
    app: hpa-nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
````
````
kubectl apply -f  service.yaml
````

# create hpa.yaml


````
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: hpa-nginx
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: hpa-nginx
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
````
````
kubectl apply -f hpa.yaml
````

# Generate Load
````
kubectl run -i --tty load-generator --image=busybox /bin/sh
````
*note:* - run below command in shell

````
while true; do wget -q -O- http://hpa-service; done
````
# check
````
kubectl get hpa -w
kubectl get pods
````
--------------------------------------------
