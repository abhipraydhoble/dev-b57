# Enable the Ingress controller
````
minikube addons enable ingress
````

# deployment-1
````
kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
````
# service-1
````
kubectl expose deployment web --type=NodePort --port=8080
````
# deployment-2
````
kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0
````
# service-2 
````
kubectl expose deployment web2 --port=8080 --type=NodePort
````

# create ingress file
````
vim ingress.yaml
````

````
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  ingressClassName: nginx
  rules:
    - host: hello-world.example
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 8080
          - path: /v2
            pathType: Prefix
            backend:
              service:
                name: web2
                port:
                  number: 8080
````
# apply ingress file
````
kubectl apply -f ingress.yaml
````

# Test your Ingress
````
curl --resolve "hello-world.example:80:$( minikube ip )" -i http://hello-world.example
````
````
curl --resolve "hello-world.example:80:$( minikube ip )" -i http://hello-world.example/v2
````
