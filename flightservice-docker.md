### Setup the mysql container:
```sh
docker run -d -p 6666:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=reservation" mysql

docker exec -it docker-mysql bash

# mysql -uroot -p 
test1234

mysql> show databases;
mysql> show tables; 
```
### Another Terminal:
```sh
docker exec -i docker-mysql mysql -uroot -ptest1234 reservation <flightdb.sql
```
### Application Container and testing:
```sh
docker build -f Dockerfile -t reservation_app .

docker run -t --link docker-mysql:mysql -p 10555:8080 reservation_app
```
**Note:**
The --link command will allow the reservation_app container to use the port of MySQL

http://localhost:10555/flightservices/flights

