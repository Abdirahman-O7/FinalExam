-- create database finalexam;

use finalexam;

drop table if exists Physician;
drop table if exists Patient;
drop table if exists Service;
drop table if exists Department;
drop table if exists Billing;

create table IF NOT EXISTS Department
 (DepartmentID smallint unsigned not null auto_increment,
  DeptName varchar(20) not null,
  RoomNumber smallint unsigned not null,
  constraint pk_department primary key (DepartmentID)
 );


 create table IF NOT EXISTS Physician 
 (PhysicianID smallint unsigned not null auto_increment,
  PhyFirstName varchar(20) not null,
  PhyLastName varchar(20) not null,
  DepartmentID smallint unsigned,
  PhyRoomNumber smallint unsigned,
  constraint pk_physician primary key (PhysicianID),
  constraint fk_physician_department 
  	foreign key (DepartmentID) references Department(DepartmentID)
  ON DELETE RESTRICT
 );
 
 create table IF NOT EXISTS Service
 (
	ServiceCode varchar(10) not null,
    ServiceDescription varchar(40) not null,
    DepartmentID smallint unsigned,
    constraint pk_service primary key (ServiceCode),
    constraint fk_service_department 
  	foreign key (DepartmentID) references Department(DepartmentID)
    ON DELETE RESTRICT
 );
 
 
 create table IF NOT EXISTS Patient
 (PatientNumber int unsigned not null auto_increment,
  PatFirstName varchar(20) not null,
  PatLastName varchar(20) not null,
  DateOfBirth date not null,
  PatStreetAddress varchar(50),
  PatCity varchar(20),
  PatState_ID varchar(2),
  PatZip_code varchar(10),
  ReasonForVisit varchar(100),
  PatServiceCode varchar(10),
  constraint pk_patient primary key (PatientNumber),
  constraint fk_patient_service 
  	foreign key (PatServiceCode) references Service(ServiceCode)
    ON DELETE RESTRICT
 );
 
 create table IF NOT EXISTS Billing
 (
  BillingNumber int unsigned not null,
  BillingAmount decimal(7, 2) unsigned not null,
  PatientNumber int unsigned,
  constraint pk_billing primary key (BillingNumber),
  constraint fk_billing_patient 
  	foreign key (PatientNumber) references Patient(PatientNumber)
    ON DELETE RESTRICT
 );
 
 insert into Department(DeptName, RoomNumber)
 values('Nursing', 383), ('Physical Medicine', 175),
 ('Rehabilitation', 266),('Pharmacy', 119),('Emergency', 81);

 select *
 from Department;

 alter table Physician
 drop column PhyRoomNumber;
 
 insert into Physician (PhyFirstName, PhyLastName, DepartmentID)
 values('Jim', 'Jones', 1),('Kelly', 'Ryan', 2),('Jenny', 'Adam', 3),
 ('Lebron', 'James', 4),('Paul', 'Scholaes', 5);
 
 select *
 from Physician;
 
 update Department
 set DeptName = 'Radiology'
 where DepartmentID = 3;
 
 select *
 from Department;
 
 insert into Service
 values('09F5S4', 'Patient Care', 1),('0F652B', 'Ankle Injury Rehab', 2),
 ('02GB34', 'X ray', 3),('0612RE', 'Medicine', 4),
 ('09GHSA', 'Critical Conditions', 5);
 
 select * 
 from Service;
 
 insert into Patient(PatFirstName, PatLastName, DateOfBirth, PatStreetAddress,
	PatCity, PatState_ID, PatZip_code, ReasonForVisit, PatServiceCode)
 values('Steph', 'Curry', '1990-10-10', 'W 37th St', 'Jefferson City',
		'MO', '61111', 'I need to get an imaging for my injury', '02GB34'),
 ('Canelo', 'Ryan', '1991-11-11', 'N 37th St', 'Liberty',
		'MO', '61112', 'I need to get a flu shot', '09F5S4'),
 ('Mike', 'Bryan', '1992-12-12', 'E 37th St', 'Belton',
		'MO', '61123', 'I sprained my ankle two weeks ago and I need a rehab', '0F652B'),
 ('Klay', 'Darell', '1993-10-13', 'S 37th St', 'Springfield',
		'MO', '60191', 'I broke my arm', '09GHSA'),
 ('Cristiano', 'Ronaldo', '1996-5-17', 'N 36th St', 'Jefferson City',
		'MO', '61115', 'I need to get my prescription', '0612RE');
        
 select *
 from Patient;
        
 insert into Billing
 values(88, 692.87, 1),(87, 792.87, 2),(78, 492.87, 3),
 (48, 2300.52, 4),(542, 50.43, 5);
 
 select *
 from Billing;
 

 