# create dockerfile 
````
FROM  amazonlinux
RUN   yum update
RUN   yum install httpd -y
COPY  index.html  /var/www/html/
EXPOSE 80
CMD   ["httpd", "-D", "FOREGROUND"]
````
# build docker image
````
docker build -t image-1 .
````
or 
````
docker build -t abhipraydh96/img-1 .
````
## list image
````
docker images
````
## push img to dockerhub
````
docker login -u abhipraydh96
````
````
docker push abhipraydh96/img-1
````

## create docker container from image
````
docker run -itd --name c1 -p 80:80 image-1
````
## check running cont
````
docker ps
````
