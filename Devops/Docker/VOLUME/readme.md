
# Docker Volume

## create docker volume
````
docker volume create vol-1
````

## list docker volume 
````
docker volume ls
````
## get vol details
````
docker inspect volume vol-1
````


## pull image from dockerhub(ubuntu)
````
docker pull ubuntu
````
## Create Cont and Mount Vol
````
docker run -itd --name c1 --mount source=vol-1,target=/dir1 ubuntu
````
or

````
docker run -itd --name c1 -v vol-1:/dir1 ubuntu
````
## list running cont
````
docker ps
````
## login into docker cont
````
docker exec -it c1 /bin/bash
````
````
cd dir1
````
## create files
````
touch index.html error.html style.css
````
## exit from cont

## Create Another Cont and Mount Vol
````
docker run -itd --name c2 --mount source=vol-1,target=/dir2 ubuntu
````
or 
````
docker run -itd --name cont2 -v vol-1:/dir2 ubuntu
````
## list running cont
````
docker ps
````
## login into docker cont
````
docker exec -it c2 /bin/bash
````
````
cd dir2
````
````
ls
````
## delete cont and volumes

````
docker rm -f cont1 cont2
````

````
docker volume rm vol1
````

