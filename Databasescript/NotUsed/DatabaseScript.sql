

CREATE TABLE Employee
(
  Fname     VARCHAR(15)     NOT NULL,
  Minit     CHAR(1),
  Lname     VARCHAR(15)     NOT NULL,
  Ssn       VARCHAR(11),
  Bdate     DATETIME,
  Address   VARCHAR(100),
  Sex       CHAR(1),
  Salary    int,
  Super_ssn VARCHAR(11),
  Dno       int        NOT NULL,
  CONSTRAINT Employee_PK PRIMARY KEY(Ssn)
);



INSERT INTO Employee 
VALUES ('John','B','Smith', '312-24-4532', '1965-01-09','731 Fondren, Houston ,TX','M',30000,'425-34-5490',5);
  
INSERT INTO Employee 
VALUES ('Franklin','T','Wong','241-43-4352','1955-12-08','638 Voss, Houston ,TX','M',40000,'273-90-8907',5);

INSERT INTO Employee 
VALUES ('Alicia','J','Zelaya','324-25-3576','1968-01-19','3321 Castle, Spring ,TX','F',25000,'273-90-8907',4);

INSERT INTO Employee 
VALUES ('Jennifer','S','Wallace','246-27-4653','1941-06-20','291 Berry, Bellaire ,TX','F',43000,'524-24-7456',4);

INSERT INTO Employee 
VALUES ('Ramesh','K','Naraan','420-42-5367','1962-09-15','975 Fire Oak Humble,TX','M',38000,'524-24-7456',5);

INSERT INTO Employee 
VALUES ('Joyce','A','English','524-24-7456','1972-07-31','5631 Rice, Houston ,TX','F',25000,'425-34-5490',5);

INSERT INTO Employee 
VALUES ('Ahmad','V','Jabbar','273-90-8907','1969-03-29','980 Dallas, Houston ,TX','M',25000,'524-24-7456',4);

INSERT INTO Employee 
VALUES ('James','E','Borg','425-34-5490' ,'1937-11-10','450 Stone, Houston ,TX','M',55000,NULL,1);





CREATE TABLE Department
(
  Dname          VARCHAR(15) NOT NULL,
  DNumber       int,
  MgrSsn          VARCHAR(11)           NOT NULL,
  MgrStartDate  DATETIME,
  CONSTRAINT Department_PK PRIMARY KEY (DNumber)
);







CREATE TABLE Dept_Locations
(
  Dnumber   int,
  Dlocation  VARCHAR(15),
  CONSTRAINT Dept_Locations_PK PRIMARY KEY(Dnumber,Dlocation)
);

INSERT INTO Dept_Locations
VALUES (1, 'Houston');

INSERT INTO Dept_Locations
VALUES (4, 'Stafford');

INSERT INTO Dept_Locations
VALUES (5, 'Bellaire');

INSERT INTO Dept_Locations
VALUES (5, 'Sugarland');

INSERT INTO Dept_Locations
VALUES (5, 'Houston');





CREATE TABLE Project
(
  Pname      VARCHAR(15)     NOT NULL,
  Pnumber    int,
  Plocation  VARCHAR(15),
  Dnum       int        NOT NULL,
  CONSTRAINT Project_PK PRIMARY KEY(Pnumber)
);






CREATE TABLE Works_On
(
  Essn   VARCHAR(11),
  Pno    int,
  Hours  int,
  CONSTRAINT Works_On_PK PRIMARY KEY (Essn, Pno)
);

INSERT INTO Works_On
VALUES('312-24-4532',1,32.5);

INSERT INTO Works_On
VALUES('312-24-453',2,7.5);

INSERT INTO Works_On
VALUES('666-88-4444',3,40.0);

INSERT INTO Works_On
VALUES('453-45-3453',1,20.0);

INSERT INTO Works_On
VALUES('453-45-3453',2,20.0);

INSERT INTO Works_On
VALUES('333-44-5555',2,10.0);

INSERT INTO Works_On
VALUES('333-44-5555',3,10.0);

INSERT INTO Works_On
VALUES('333-44-5555',10,10.0);

INSERT INTO Works_On
VALUES('333-44-5555',20,10.0);

INSERT INTO Works_On
VALUES('999-88-7777',30,30.0);

INSERT INTO Works_On
VALUES('999-88-7777',10,10.0);

INSERT INTO Works_On
VALUES('987-98-7987',10,35.0);

INSERT INTO Works_On
VALUES('987-98-7987',30,5.0);

INSERT INTO Works_On
VALUES('987-65-4321',30,20.0);

INSERT INTO Works_On
VALUES('987-65-4321',20,15.0);

INSERT INTO Works_On
VALUES('888-66-5555',20,NULL);




DROP TABLE Dependent ;

CREATE TABLE Dependent
(
  Essn            VARCHAR(11),
  Dependent_name  VARCHAR(15),
  Sex             CHAR(1),
  Bdate           DATETIME,
  Relationship    VARCHAR(8),
  CONSTRAINT Dependent_PK PRIMARY KEY (Essn, Dependent_name)
);

INSERT INTO Dependent 
VALUES('333-44-5555','Alice','F','1986-04-05','Daughter');

INSERT INTO Dependent 
VALUES('333-44-5555','Theodore','M','1983-10-25','Son');

INSERT INTO Dependent 
VALUES('333-44-5555','Joy','F','1958-05-03','Spouse');

INSERT INTO Dependent 
VALUES('98-765-4321','Abner','M','1942-02-28','Spouse');

INSERT INTO Dependent 
VALUES('312-24-4532','Michael','M','1988-01-04','Son');

INSERT INTO Dependent 
VALUES('312-24-4532','Alice','F','1988-12-30','Daughter');

INSERT INTO Dependent 
VALUES('312-24-4532','Elizabeth','F','1967-05-05','Spouse');







