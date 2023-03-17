create database CUSTOMER_DATABASE;
use CUSTOMER_DATABASE;

create table  CUSTOMER(
     Cus_ID         int   not null      Primary key,
     FirstName   Varchar(50)  not null,
     LastName    Varchar(50)  not null,
     Birthday    Datetime,
     Phone       Varchar(10)  not null,
     Email       Varchar(20) ,
     Address     Varchar(100) not null,
     Country     Varchar(20),
     Company     Varchar(30)
     );

create table PRODUCT(
	 Pro_ID       int  not null   Primary key,
     ProductName  Varchar(50)   not null,
     Quantity     int,
     ProductionDate Datetime  not null,
     Prices  Varchar(50),
     Statuss Varchar(225)
     );

insert into  CUSTOMER( Cus_ID,FirstName,LastName,Birthday,Phone,Email,Address,Country,Company )
values ('1','Kieu','Ho','2003-11-28','0768547186','kieu.ho24@student','101B-Le Huu Trac','Da Nang','Abc'),
	   ('2','Tai','Ho','2003-03-02','0769247101','tai.ho24@student','101B-Le Huu Trac','Da Nang',null),
       ('3','Ha','Y','2003-06-07','039238416','ha.y24@student','101B-Le Huu Trac','Da Nang',null),
       ('4','Son','Ngoc','2003-12-30','0768546196','son.ngoc@student','102B-La Huu Trac','Da Nang','SQA'),
       ('5','Di','Ho','2004-11-29','0392715692','di.ho24@student','Huong Hoa','Quang Tri',null);


insert into PRODUCT(Pro_ID,ProductName,Quantity,ProductionDate,Prices,Statuss)
values ('0','Sunsill','02','2022-11-28','20.000VND',null),
       ('1','Lifebuoy','10','2022-11-30','19.000VND',null),
       ('2','Laptop Acer Aspire Vero','01','2022-08-04','20.000.000VND','old'),
       ('3','Iphone 13','05','2020-01-14','899 USD','new'),
       ('4','Enchanter','03','2022-11-26','30.000VND',null);

alter table PRODUCT
modify  Statuss   text;


alter table PRODUCT
add Category  Varchar(100);


alter table CUSTOMER
add gender   binary;


update  CUSTOMER
set FirstName='Lan' where Cus_ID=1;

update  CUSTOMER
set Address='Ta Long-Dakrong-Quang Tri',Country='Quang Tri'
where FirstName='Kieu';


update PRODUCT
set Prices=300.000
where Prices;

update CUSTOMER
set Address='Da Nang' where Cus_ID=4;

delete from CUSTOMER Where Address = 'Da Nang';



delete from PRODUCT Where Quantity < 15 ;

alter table CUSTOMER rename to Customer_Info;

drop table PRODUCT;

