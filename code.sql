create database taxiserviceproject;
use taxiserviceproject ;

CREATE TABLE TAXI (
   Taxi_id integer NOT NULL,
   Registration_no VARCHAR(20),
   Taxi_Model VARCHAR(20),
   Taxi_Year DATE,
   Taxi_type VARCHAR(20),
   Status VARCHAR(20),
   Driver_id integer,
   PRIMARY KEY (Taxi_id),
   UNIQUE (Registration_no)
);

CREATE TABLE  USER_TBL (
   Usr_id integer NOT NULL,
   F_name VARCHAR(20),
   L_name VARCHAR(20),
   Contact_no CHAR(10),
   Gender VARCHAR(10),
   Address VARCHAR(50),
   Taxi_id integer,
   PRIMARY KEY (Usr_id)
);

CREATE TABLE   DRIVER (
   Driver_id integer NOT NULL,
   F_name VARCHAR(10),
   L_name VARCHAR(20),
   Gender VARCHAR(10),
   Conatct_no VARCHAR(20),
   Rating integer,
   Age integer,
   PRIMARY KEY (Driver_id)
);

CREATE TABLE  TRIP_DETAILS (
   Trip_id integer NOT NULL,
   Trip_date DATE,
   Trip_amt decimal(10,2),
   Driver_id integer,
   Usr_id integer,
   Taxi_id integer,
   Strt_time TIMESTAMP,
   End_time TIMESTAMP,
   PRIMARY KEY (Trip_id)
);

CREATE TABLE BILL_DETAILS (
   Bill_no integer NOT NULL,
   Bill_date DATE,
   Advance_amt decimal(10,2),
   Discount_amt decimal(10,2),
   Total_amt decimal(10,2),
   Usr_id integer,
   Trip_id integer,
   PRIMARY KEY (Bill_no),
   UNIQUE (Trip_id)
);

CREATE TABLE  CUSTOMER_SERVICE (
   Emp_id integer NOT NULL,
   F_name VARCHAR(20),
   L_name VARCHAR(20),
   PRIMARY KEY (Emp_id)
);

CREATE TABLE  FEEDBACK (
   Fbk_id integer NOT NULL,
   Message VARCHAR(140),
   Email VARCHAR(50),
   Emp_id integer,
   Usr_id integer,
   Trip_id integer,
   PRIMARY KEY (Fbk_id),
   UNIQUE (Emp_id)
);

CREATE TABLE  OWNS (
   Owner_id integer NOT NULL,
   No_Cars  integer,
   PRIMARY KEY (Owner_id)
);

CREATE TABLE  OWNER_TAXI (
   Owner_id integer NOT NULL,
   Taxi_id integer,
   PRIMARY KEY (Owner_id, Taxi_id)
);

CREATE TABLE INDIVIDUAL (
   Ssn integer NOT NULL,
   Name VARCHAR(20),
   Owner_id integer,
   PRIMARY KEY (Ssn)
);

CREATE TABLE  TAXI_SERVICE_COMPANY (
   Tsc_id integer NOT NULL,
   Tsc_name VARCHAR(20),
   Owner_id integer,
   PRIMARY KEY (Tsc_id)
);



ALTER TABLE TAXI ADD CONSTRAINT fketadr FOREIGN KEY (Driver_id) REFERENCES DRIVER(Driver_id) ON DELETE CASCADE;
ALTER TABLE USER_TBL ADD CONSTRAINT fkusta FOREIGN KEY (Taxi_id) REFERENCES TAXI(Taxi_id) ON DELETE CASCADE;
ALTER TABLE TRIP_DETAILS ADD CONSTRAINT fktddr FOREIGN KEY (Driver_id) REFERENCES DRIVER(Driver_id) ON DELETE CASCADE;
ALTER TABLE TRIP_DETAILS ADD CONSTRAINT fktdusr FOREIGN KEY (Usr_id) REFERENCES USER_TBL(Usr_id) ON DELETE CASCADE;
ALTER TABLE TRIP_DETAILS ADD CONSTRAINT fktdtax FOREIGN KEY (Taxi_id) REFERENCES TAXI(Taxi_id) ON DELETE CASCADE;
ALTER TABLE BILL_DETAILS ADD CONSTRAINT fkbdtd FOREIGN KEY (Trip_id) REFERENCES TRIP_DETAILS(Trip_id) ON DELETE CASCADE;
ALTER TABLE BILL_DETAILS ADD CONSTRAINT fkbdusr FOREIGN KEY (Usr_id) REFERENCES USER_TBL(Usr_id) ON DELETE CASCADE;
ALTER TABLE FEEDBACK ADD CONSTRAINT fkfbemp FOREIGN KEY (Emp_id) REFERENCES CUSTOMER_SERVICE(Emp_id) ON DELETE CASCADE;
ALTER TABLE FEEDBACK ADD CONSTRAINT fkfbtd FOREIGN KEY (Trip_id) REFERENCES TRIP_DETAILS(Trip_id) ON DELETE CASCADE;
ALTER TABLE FEEDBACK ADD CONSTRAINT fkfbusr FOREIGN KEY (Usr_id) REFERENCES USER_TBL(Usr_id) ON DELETE CASCADE;
ALTER TABLE OWNER_TAXI ADD CONSTRAINT fkeowtax FOREIGN KEY (Taxi_id) REFERENCES TAXI(Taxi_id) ON DELETE CASCADE;
ALTER TABLE OWNER_TAXI ADD CONSTRAINT fkeowowns FOREIGN KEY (Owner_id) REFERENCES OWNS(Owner_id) ON DELETE CASCADE;
ALTER TABLE INDIVIDUAL ADD CONSTRAINT fkeinowns FOREIGN KEY (Owner_id) REFERENCES OWNS(Owner_id) ON DELETE CASCADE;
ALTER TABLE TAXI_SERVICE_COMPANY ADD CONSTRAINT fketscowns FOREIGN KEY (Owner_id) REFERENCES OWNS(Owner_id) ON DELETE CASCADE;


INSERT INTO DRIVER VALUES(1,'Abhi','Gowda','Male','9873805870',5,25);
INSERT INTO TAXI VALUES(1,'KA-15R-3367','BENZE 300','2022-01-01','SUV','Available',1) ;
INSERT INTO USER_TBL VALUES(1,'USER1','LNAME1','9474692934','Male','Rohini','1');
INSERT INTO TRIP_DETAILS VALUES(1,'2022-01-01',123,1,1,1,'2022-01-01 06:14:00','2022-01-01 08:14:00');
INSERT INTO BILL_DETAILS VALUES(1,'2022-01-01',1000.10,20.11,null,1,1);
INSERT INTO CUSTOMER_SERVICE VALUES(1,'prashuk','ajmera');
INSERT INTO CUSTOMER_SERVICE VALUES(2,'abhi','gowda');
INSERT INTO FEEDBACK VALUES(1,'good','prashuk.ajmera@gmail.com',1,1,1);
INSERT INTO FEEDBACK VALUES(2,'not so good','abhi@gmail.com',2,1,1);
INSERT INTO OWNS VALUES(1,1);
INSERT INTO OWNS VALUES(2,1);
INSERT INTO OWNER_TAXI VALUES (1,1);
INSERT INTO INDIVIDUAL VALUES(123,'abhi owner ind',1);
INSERT INTO TAXI_SERVICE_COMPANY VALUES (1,'abhi taxi comp',2);

INSERT INTO DRIVER VALUES(2,'Ashish','Tiwari','Male','9874735870',4,29);
INSERT INTO DRIVER VALUES(3,'Ali','Waris','Male','8874735870',3,24);
INSERT INTO DRIVER VALUES(4,'Sahil','Sharma','Male','9074735870',5,22);
INSERT INTO DRIVER VALUES(5,'Suresh','Arora','Male','9871478870',4,29);
INSERT INTO DRIVER VALUES(6,'Mohan','Gupta','Male','9912856481',3,24);
INSERT INTO DRIVER VALUES(7,'Suresh','Arora','Male','8891478870',5,32);

select * from driver ;

INSERT INTO TAXI VALUES(2,'DL-2C-3237','Swift Dzire','2021-05-02','Mini','Available',5) ;
INSERT INTO TAXI VALUES(3,'MH-45D-2347','Honda City','2020-02-25','Sedan','Available',6) ;
INSERT INTO TAXI VALUES(4,'DL-4F-6462','Indica','2019-05-29','Economy','Not Available',7) ;
INSERT INTO TAXI VALUES(5,'DL-19R-2218','SWIFT XJF','2020-08-01','minivan','Available',2);
INSERT INTO TAXI VALUES(6,'HR-2C-1307','INOVA CC','2020-01-01','SUV','Aailable',3);
INSERT INTO TAXI VALUES(7,'DL-13C-1020','ERTIGA','2019-04-01','SUV','Available',4);

INSERT INTO USER_TBL VALUES(2,'USER2','LNAME2','9875634738','Male','Shalimar Bagh','7');
INSERT INTO USER_TBL VALUES(3,'USER3','LNAME3','8765634738','Male','Rohtak','6');
INSERT INTO USER_TBL VALUES(4,'USER2','LNAME2','9875634738','Female','Rajori','7');
INSERT INTO USER_TBL VALUES(5,'USER5','LNAME5','9013845861','Male','JHANGIRPURI','2');
INSERT INTO USER_TBL VALUES(6,'USER6','LNAME6','9812332156','FEMALE','ROHINI','3');
INSERT INTO USER_TBL VALUES(7,'USER7','LNAME7','8801284536','Male','PITAMPURA','4');
update user_tbl set L_name='LNAME1' , Contact_no='9846238247' , Address = 'Rohini' where Taxi_id = 1 ; 

INSERT INTO TRIP_DETAILS VALUES(4,'2021-04-01',550,6,4,3,'2021-04-01 06:20:00','2021-04-02 00:15:00');
INSERT INTO TRIP_DETAILS VALUES(5,'2020-08-22',234,7,5,4,'2020-08-22 06:14:00','2020-08-22 08:14:00');
INSERT INTO TRIP_DETAILS VALUES(2,'2022-02-10',510.00,2,3,5,'2022-02-10 13:10:00','2022-02-10 15:15:00');
INSERT INTO TRIP_DETAILS VALUES(3,'2022-03-15',100.00,3,6,6,'2022-03-15 16:16:00','2022-03-15 16:50:00');

INSERT INTO BILL_DETAILS VALUES(4,'2021-04-01',600.00,50.11,549.89,4,4);
INSERT INTO BILL_DETAILS VALUES(5,'2020-08-22',500.50,20.00,530.50,5,5);
INSERT INTO BILL_DETAILS VALUES(2,'2022-02-10',200.00,10.00,500,3,2);
INSERT INTO BILL_DETAILS VALUES(3,'2022-03-15',50.00,5.00,95,6,3);

INSERT INTO CUSTOMER_SERVICE VALUES(5,'parag','goyal');
INSERT INTO CUSTOMER_SERVICE VALUES(3,'Aman','Gupta');
INSERT INTO CUSTOMER_SERVICE VALUES(4,'Dhruv','Sharma');

INSERT INTO FEEDBACK VALUES(5,'bad','parag.goyal@gmail.com',5,5,5);
INSERT INTO FEEDBACK VALUES(3,'Excellent','Aman.gupta@gmail.com',3,6,3);
INSERT INTO FEEDBACK VALUES(4,'good','dhruv2001@gmail.com',4,4,4);

INSERT INTO OWNS VALUES(3,2);
INSERT INTO OWNS VALUES(4,1);
INSERT INTO OWNS VALUES(5,2);

INSERT INTO OWNER_TAXI VALUES (2,2);
INSERT INTO OWNER_TAXI VALUES (3,3);
INSERT INTO OWNER_TAXI VALUES (3,4);
INSERT INTO OWNER_TAXI VALUES (4,5);
INSERT INTO OWNER_TAXI VALUES (5,6);
INSERT INTO OWNER_TAXI VALUES (5,7);

INSERT INTO INDIVIDUAL VALUES(007,'lakshay grover',4);
INSERT INTO INDIVIDUAL VALUES(420,'Gopal Mehra',5);
INSERT INTO INDIVIDUAL VALUES(134,'Akshit owner ind',2);
INSERT INTO INDIVIDUAL VALUES(145,'Dhruv owner ind',3);

INSERT INTO TAXI_SERVICE_COMPANY VALUES (2,'Ashish taxi comp',3);
INSERT INTO TAXI_SERVICE_COMPANY VALUES (3,'Motor taxi comp',2);
INSERT INTO TAXI_SERVICE_COMPANY VALUES (4,'Genericc taxi comp',5);
INSERT INTO TAXI_SERVICE_COMPANY VALUES (5,'Delta taxi comp',4);

update taxi_service_company set owner_id = 1 where Tsc_id =1 ;





