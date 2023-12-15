CREATE DATABASE reservation;

USE reservation;

CREATE TABLE flight
(
  ID INT  NOT NULL AUTO_INCREMENT,
  FLIGHT_NUMBER VARCHAR(20)  NOT NULL, 
  OPERATING_AIRLINES VARCHAR(20)  NOT NULL,
  DEPARTURE_CITY VARCHAR(20)  NOT NULL,
  ARRIVAL_CITY VARCHAR(20)  NOT NULL,
  DATE_OF_DEPARTURE DATE  NOT NULL,
  ESTIMATED_DEPARTURE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
  PRIMARY KEY (ID)
);

insert into flight values(1,'AA1','American Airlines','AUS',
'NYC',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 03:14:07');

insert into flight values(2,'AA2','American Airlines','AUS',
'NYC',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 05:14:07');

insert into flight values(3,'AA3','American Airlines','AUS',
'NYC',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 06:14:07');

insert into flight values(4,'SW1','South West','AUS',
'NYC',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 07:14:07');

insert into flight values(5,'UA1','United Airlines','NYC',
'DAL',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 10:14:07');

insert into flight values(6,'UA1','United Airlines','NYC',
'DAL',STR_TO_DATE('02-05-2018', '%m-%d-%Y'),'2018-02-05 10:14:07');

insert into flight values(7,'SW1','South West','AUS',
'NYC',STR_TO_DATE('02-06-2018', '%m-%d-%Y'),'2018-02-06 07:14:07');

insert into flight values(8,'SW2','South West','AUS',
'NYC',STR_TO_DATE('02-06-2018', '%m-%d-%Y'),'2018-02-06 08:14:07');

insert into flight values(9,'SW3','South West','NYC',
'DAL',STR_TO_DATE('02-06-2018', '%m-%d-%Y'),'2018-02-06 10:14:07');

insert into flight values(10,'UA1','United Airlines','NYC',
'DAL',STR_TO_DATE('02-06-2018', '%m-%d-%Y'),'2018-02-06 10:14:07');
