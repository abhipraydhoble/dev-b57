# Create EKS Cluster Using CLI

- launch one instance t3.micro
- generate access keys


## Install eksctl CLI tool for creating EKS Clusters on AWS

```` 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
````
````
sudo mv /tmp/eksctl /usr/local/bin
```` 
```` 
eksctl version
````

## Install kubectl
````
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
````
````
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
````
````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
````
````
kubectl version --client
````

## Install AWS CLI on Ubuntu

````
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
````


## Configure AWS CLI
````
aws configure
````
- provide access_key
- provide secret_key
- provide region name

## Create Amazon EKS cluster using eksctl
````
eksctl create cluster --name b57-ekscluster --region ap-southeast-1 --version 1.33 --nodegroup-name linux-nodes --node-type t3.medium --nodes 2
````
## Log In Into EKS cluster
````
aws eks update-kubeconfig --name b57-ekscluster
````
## Delete EKS Cluster
````
eksctl delete cluster --name b57-ekscluster --region ap-southeast-1
````
