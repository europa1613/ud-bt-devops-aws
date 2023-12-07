# ud-bt-devops-aws
DevOps - AWS, Kubernetes, Docker,  Jenkins, Spring &amp; Java


### SSH into EC2

**Instance ID**
i-018b3b0472491e451 (linux)
Open an SSH client.

Locate your private key file. The key used to launch this instance is awskey.pem

Run this command, if necessary, to ensure your key is not publicly viewable.
```sh
 chmod 400 awskey.pem
```
Connect to your instance using its Public DNS:
```
 ec2-18-218-9-184.us-east-2.compute.amazonaws.com
```
**Example:**
```sh
 ssh -i "awskey.pem" ec2-user@ec2-18-218-9-184.us-east-2.compute.amazonaws.com
```

### Maven 
#### CLI Generate Project
```sh
mvn archetype:generate -DgroupId=com.example -DartifactId=hellomaven -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

mvn archetype:generate -DgroupId=com.example -DartifactId=java-project -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false


mvn archetype:generate -DgroupId=com.example -DartifactId=java-web-project -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

```
#### Run Java Jar from CLI
```sh
java -cp path-to-jar.jar com.example.MainClass
```


## Deploy coupon api to EC2

```sh
yum install -y mariadb-server
#yum install -y mariadb105-server.x86_64 #worked

systemctl enable mariadb

systemctl start mariadb

#mysql_secure_installation - is command, must after installing mariadb
#Switch to unix_socket authentication [Y/n] n
#Change the root password? [Y/n] Y
# all other hit enter
mysql_secure_installation

#enter password
mysql -uroot -p

#create below after entering into mysql prompt
CREATE DATABASE mydb;
USE mydb;

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(100),
    price DECIMAL(8 , 3 )
);

CREATE TABLE coupon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) UNIQUE,
    discount DECIMAL(8 , 3 ),
    exp_date VARCHAR(100)
);
SHOW TABLES;
SELECT * FROM product;
SELECT * FROM coupon;


#---------Java-----------

yum install java-1.8.0-openjdk
#worked
#yum install java-1.8.0-amazon-corretto.x86_64 
alternatives --config java


# upload spring boot java jar to s3 and download to ec2 instance
wget "https://ud-bt-devops.s3.us-east-2.amazonaws.com/couponservice-0.0.1-SNAPSHOT.jar?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCXVzLWVhc3QtMSJHMEUCIF%2FjFr75x7SQ3g7XvL7wT0kzv%2FRDgIdJ4foc8Fl7KlIDAiEAxlWt6b7nTfB%2BZ4R9fVVdDihBn7KzplcGKM%2FAV6ruWUkqhAMIgf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARABGgwxNjk3MDM3ODA0MTUiDALJSzgOjjLuTjDCuCrYAl%2F2C99Ag%2BeM1vDEfmLIbc393APvwjZEx9aoGRg5jfuFYosd1NOPF4nUSdpFAVd%2BzM7B3TUk0CQQt5PldlGlRUDwSGB8wJorBzycENob%2Bl%2FGRKmy1AHvrf4aBh2MTVq0TezA%2FQEN%2FQ8B8tThI%2BEh7DH09n9XTdoAGz0msYDTc7KnSMi6nlRWT4nJUmvxJR8P538kkeurnXDVeqyW6YlG7bHC3nfCW%2FeHC0CJF%2FpRkJxTHdRb4LaY5V3utoB8yWYtomNh9Mx2Lvw14LJ3SLqhPHaNOu4sEQrJgtjEfxVL6S6xlL%2BNt6qZSeGHY1azcyqmjHEqB5EPcjKPh3WoliGfubujQPenEaOanKWh%2FnaR1CBW96IUR3EMs3N4BAgZm9zEKKr5Y4SbTyMjbUno7SVVdfDa%2FTOOQiI26O6LFwth3pH9pNgWQhixVS8cBHsW3gAe7wQ5pL9KPv%2BDMMSTvasGOrMCC%2BWeTeeVYVI7zfpxBpP3kk2BbSyfX4Fuezh%2BK6rsuvi6PprnGTc41sEyzofjGD8ix1BjdSNTyCAr9SCiD4M%2FrHnnZNvpsgEij%2FhCTjotZ6vIglzU0tbY2DmVKn33Qh8xPBiMIWX4i7o1cOzU2TLxMQVVaziwPg9aNfvdKZyVTE1U%2BaXdvPv6YiJXzdjcpVqLZmKdJc%2B6Yp35eUeySJMTuDcGP5icl0ClO6jsIIleJUFLq%2FeR%2FVQ12U8NDqfkKpwq9cHcdW5sS9ZNPn7k5ALOrnKy2Z3uGC80sYMoaImYUtoLu0XTlkZHbLTesCQDTf4In2uEKxzsjmIj0EfR9yxgpnaqGA2wF02Y%2Fj%2FJSeYs8Svhqr9ugtef5KnBBgVnCwk85FPilGecuGx2%2B5BgvVdwlRwD0w%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231206T001309Z&X-Amz-SignedHeaders=host&X-Amz-Expires=43200&X-Amz-Credential=ASIASPAZCGA7Y4QEKUEF%2F20231206%2Fus-east-2%2Fs3%2Faws4_request&X-Amz-Signature=809c4aa28fc8f8eac43c37ac1e1c9d9a2cc81c08e4e28331943ba594d2f0e0f2"


# test application run
# note mariadb-mysql setup must setup with same datasource creds the app is connecting to
java -jar /home/ec2-user/example-app.jar

# change inboud security group to allow http/tcp on 9091 port

# POST Coupon 
curl --location 'http://ec2-3-23-89-140.us-east-2.compute.amazonaws.com:9091/couponapi/coupons' \
--header 'Content-Type: application/json' \
--data '{
    "code": "SUPERSALE",
    "discount": 10,
    "expDate": "12/12/2023"
}'

# GET Coupon
curl --location 'http://ec2-3-23-89-140.us-east-2.compute.amazonaws.com:9091/couponapi/coupons/SUPERSALE'
```

### rc.local NOT WORKING
```sh
#Make application to run on startup of ec2
#add startup of the application
cat /etc/rc.local # rc - run command

cp example-app.jar /home/ec2-user

vi /etc/rc.local
#ESC+a append at the end
java -jar /home/ec2-user/couponservice-0.0.1-SNAPSHOT.jar

#change mode to execution permissions (+x) of the symlink for rc.local
chmod +x /etc/rc.d/rc.local

# NOTE if this doesn't work 
sudo systemctl enable rc-local.service
#Also refer:
# https://www.udemy.com/course/devops-tools-and-aws-for-java-microservice-developers/learn/lecture/14183053/#questions/12956744

# https://www.udemy.com/course/devops-tools-and-aws-for-java-microservice-developers/learn/lecture/14183053/#questions/13531692

```

### Use crontab instead

```sh
# https://jainsaket-1994.medium.com/installing-crontab-on-amazon-linux-2023-ec2-98cf2708b171

sudo -i

sudo yum install cronie -y

sudo systemctl enable crond.service

sudo systemctl start crond.service

sudo systemctl status crond | grep Active
     Active: active (running) since Wed 2023-12-06 01:18:46 UTC; 13s ago

# Optional
sudo systemctl status crond.service 

# Add start script
# https://www.cyberciti.biz/faq/linux-execute-cron-job-after-system-reboot/

crontab -e

# Add below
@reboot java -jar /home/ec2-user/couponservice-0.0.1-SNAPSHOT.jar

```


```sh
#extras
yum install stress -y
amazon-linux-extras install epel -y
yum install stress -y

#100% load
stress --cpu 1 

```


## Docker

```bash
yum install docker -y
docker --version
docker info # docker daemon not started;Cannot connect to docker to Docker Daemon message

service docker start
docker info # should work now

docker images # list downloaded images

docker run hello-world

docker run -it ubuntu bash
# -it: i = interactive, t = launch terminal

docker pull mysql:5.7


docker run -i -d -t -p 80:80 nginx
docker run -idt -p 80:80 nginx #same as above, combined the -itd options
# -i interactive
# -d detached
# -t terminal
# -p publish - host-port:container-port

docker ps # docker process status

docker stop <container id> # stop a running container
docker start <container id> # start a stopped container


docker info # gives info on images and containers - current state

# clean up
docker ps -a # list all the containers available, including stopped

# Deleting containers
docker rm <container id> # to delete a stopped container
docker rm <container id 1> <container id 2>  # to delete a multiple stopped containers
docker rm -f <container id> # to forcefully delete a running container

#Deleting images
docker rmi <image id(s)> # spaced image id, command: `docker images`

```

### More Commands
```sh
docker run -dit nginx
docker ps
docker run -itd nginx # launches another container 

# To change the container name
docker run -itd --name=mycontainer nginx # image name must always be at the end
docker stop <container name> # can use container name or id to start or stop 

docker run -itd --name=mynginx -p 8000:80 nginx 

docker restart <container name/id>
docker pause <container name/id>
docker unpause <container name/id>
```

### `docker commit`

```sh

# not recommended, but for quick sharing of images 
# Dockerfile is the recommended way
docker commit <container-id> <image-name>

docker pull ubuntu

docker run -dit ubuntu
docker ps

#exec - execute on the container; below bash interactive terminal
docker exec -it <container-id> bash

# in the container
    apt-get update
    apt-get install apache2

    service apache2 status
    service apache2 start
    mkdir demo
#back to host machine
docker ps # find the container id
docker commit <container-id> myapache2-buntu

docker imagess

docker run -dit --name=myweb myapache2-buntu
docker exec -it myweb bash

```

### Docker Layers and Overlay
```sh
docker history <image-name> # list all layer of an image 

docker info # look for Docker Root Directory in the output
# usually
# Docker Root Dir: /var/lib/docker

cd /var/lib/docker
ls
cd overlay2 # from docker v17 overlay2

```
**Overlay** is the storage driver of docker

### Launch MySQL Container
```sh
docker run -d -p 6666:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=emp" mysql
docker run -d -p 6666:3306 --name arvins-mysql -e "MYSQL_ROOT_PASSWORD=test12345" -e "MYSQL_DATABASE=EMP" mysql

docker exec -it docker-mysql bash
docker exec -it arvins-mysql bash

mysql -uroot -p 
test12345
mysql> show databases;

mysql> show tables; 

```


### Bind Mounts & Volumes
**Bind Mounts**
- Any folder on the host machine for docker container to store data
- Not managed by docker
- `docker run -dit -v /root/mydata/:/mytemp ubuntu`
```sh
#host
mkdir mydata
docker run -dit -v /root/mydata/:/mytemp ubuntu

docker ps
docker exec -it a47eaa16f144 bash

#container
root@a47eaa16f144:/# cd mytemp/
root@a47eaa16f144:/mytemp# echo "Hello from container bound mount" > 1.txt
root@a47eaa16f144:/mytemp# cat 1.txt
Hello from container bound mount
root@a47eaa16f144:/mytemp# exit
exit
[root@ip-172-31-18-126 ~]# cat mydata/1.txt
Hello from container bound mount

```
**Volumes**
- Volumes are created and managed by docker
- Created in /var/lib/docker/volumes on the host machine
- Recommened over Bind mounts
- `docker run -dit --mount source=myvol,destination=/mytemp nginx`
```sh
docker volume ls
docker volume create myvol
ls /var/lib/docker/volumes/myvol/_data/ # has _data folder created

docker run -dit --mount source=myvol,destination=/mytemp nginx
docker ps
docker exec -it f033965c5139 bash
root@f033965c5139:/# cd mytemp/
root@f033965c5139:/mytemp# touch 1.txt 2.txt 3.txt
# exit container
[root@ip-172-31-18-126 ~]# ls /var/lib/docker/volumes/myvol/_data/
1.txt  2.txt  3.txt

# host
[root@ip-172-31-18-126 ~]# echo "Hello from host machine" > /var/lib/docker/volumes/myvol/_data/4.txt
[root@ip-172-31-18-126 ~]# ls /var/lib/docker/volumes/myvol/_data/
1.txt  2.txt  3.txt  4.txt

# container
[root@ip-172-31-18-126 ~]# docker exec -it f033965c5139 bash
root@f033965c5139:/# cat mytemp/4.txt
Hello from host machine

```