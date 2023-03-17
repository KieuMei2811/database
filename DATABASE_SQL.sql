CREATE DATABASE foodpanda;
USE foodpanda;
CREATE TABLE address(
  address_id  INT not null,
  street   VARCHAR(30) not null,
  city   VARCHAR(30),
  province  VARCHAR(30),
  PRIMARY KEY (address_id)
  );
CREATE TABLE customer(
  customer_id  INT  not null,
  firstname  VARCHAR(30) not null,
  lastname  VARCHAR(30) not null,
  email   VARCHAR(50) not null, 
  phone  VARCHAR(30) not null,
  address_id  INT  not null,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (address_id) REFERENCES address (address_id)
  );
CREATE TABLE restaurant(
  restaurant_id  INT  not null,
  restaurant_name   VARCHAR(50)  not null,
  website VARCHAR(30) not null,
  phone   VARCHAR(30)  not null,
  address_id  INT not null,
  PRIMARY KEY (restaurant_id),
  FOREIGN KEY (address_id) REFERENCES address (address_id)
  );
CREATE TABLE food_item(
  fooditem_id  INT  not null,
  food_name  VARCHAR(50) not null,
  unit_price  INT  not null,
  food_category VARCHAR(50) not null,
  restaurant_id  INT not null,
  PRIMARY KEY(fooditem_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id)
  );
CREATE TABLE delivery_person(
  deliveryperson_id INT not null,
  delivery_name  VARCHAR(50),
  phone  VARCHAR(30) not null,
  vehicle  VARCHAR(30) not null,
  PRIMARY KEY ( delivery_person_id)
  );
CREATE TABLE orders(
   orders_id  INT  not null,
   date_of_oders  DATETIME not null,
   pick_up TINYINT(1)  not null,
   customer_id  INT  not null,
   restaurant_id  INT  not null,
   deliveryperson_id INT not null,
   PRIMARY KEY (orders_id),
   FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
   FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id),
   FOREIGN KEY (deliveryperson_id) REFERENCES delivery_person (deliveryperson_id)
   );
CREATE TABLE orders_footitem(
   orders_id INT not null,
   fooditem_id  INT not null,
   quantity  INT ,
   PRIMARY KEY (orders_id , fooditem_id),
   FOREIGN KEY (orders_id) REFERENCES orders (orders_id),
   FOREIGN KEY (fooditem_id ) REFERENCES food_item (fooditem_id )
   );
 SELECT*FROM address;
INSERT INTO address(address_id, street, city, province)
VALUES ('1','292 Bà Triệu','Hà Nội',null),
	   ('2','26-28 Trần Phú','Nha Trang','Khánh Hòa'),
       ('3','132 Lê Duẩn','Đà Nẵng',null),
       ('4','101B Lê Hữu Trác','Đà Nẵng',null),
       ('5','99 Tô Hiến Thành','Đà Nẵng',null),
       ('6','47 Ngõ Phất Lộc','Hà Nội',null),
       ('7','34 Phan Phù Tiên','Hà Nội',null);
SELECT*FROM address;
UPDATE address
SET province = 'Khanh Hoa'
			 
Where address_id= '2';

SELECT*FROM delivery_person;
 INSERT INTO delivery_person(deliveryperson_id,delivery_name, phone, vehicle)
 VALUES ('0','Thanh Nhan','Bicycle','0947582234'),
		('1','Linh','Motobike','0932307024'),
        ('2','Tan Phat','Bicycle','0905521874'),
       ('3','Van Nhat','Motobike','0928479391');
SELECT*FROM food_item;
INSERT INTO food_item(fooditem_id,food_name,unit_price,food_category,restaurant_id)
VALUES ('1','Blueberry Vani','12000','Sliced cakes','1'),
       ('2','Baguette','15000','Breads','1'),
       ('3','Lemon Cream Cake','10000','Sliced cakes','1'),
       ('4','Sandwich','14000','Packaged products','1'),
       ('5','Pepsi Can','17000','DESSERTS - DRINKS','3'),
	   ('6','Egg Tart (1 Pc)','17000','DESSERTS - DRINKS','3'),
       ('7','KFC Popcorn (R) (1 Pc)','36000','SNACKS','3'),
       ('8' ,'Fish Sticks (3 Pcs)','40000','SNACKS','3'),
       ('9','Fried Chicken (1 Pc)','35000','FRIED – ROASTED CHICKEN','3'),
       ('10','Roasted Chicken Leg Quarter (1 Pc)','67000','FRIED – ROASTED CHICKEN','3'),
       ('11','Shrimp Burger (1 Pc)','41000','RICE - BURGER - PASTA','3'),
       ('12','Burrata with Parma Ham & Mixed Tropical','230000','Salad','2'),
       ('13','Crab Tomato Cream Spaghetti with Ricotta','248000','Pizza Pasta and Main Dishes','2'),
       ('14','Salmon Miso Cream','268000','Pizza, Pasta and Main Dishes','2'),
       ('15','House- made Cheese Pizza','280000','Pizza Pasta and Main Dishes','2');   

select*from restaurant;
INSERT INTO restaurant(restaurant_id,restaurant_name,website,phone,address_id)
VALUES ('1','ABC Bakery','abcbakery.co','0236 7109 864','3'),
       ('2','Pizza 4Ps','Pizza4ps.com','19006043','2'),
       ('3','KFC','kfcvietnam.com.vn','(028) 38489828','1'); 

select*from customer;
INSERT INTO customer(customer_id,firstname,lastname,email,phone,address_id)
VALUES ('1','Anh Minh','Le Tran','minh.le24@student.passerellesnumeriques.','0915570479','4'),
       ('2','Hanh',	'Huynh',null,'0363739109','4'),
       ('3','Thu Huong','Phan Thi',	null,'0814619859','5'),
       ('4','Van Di','Ho','di.ho24@student.passerellesnumeriques.or','0359215610','6'),
       ('5','Tai','Ho',null,'0362271203','7'),
       ('6','Huu','Tran',null,'0395142866','4');
select*from orders;
INSERT INTO orders(orders_id,date_of_oders,pick_up,customer_id,restaurant_id,deliveryperson_id)
VALUES ('1','2022-12-11',true,'2','1',null),
       ('2','22-08-06 15:30',false,'1','1','1'),
       ('3','8:10 2022-03-21',false,'5','3','0');


select*from orders_footitem;	
INSERT INTO orders_footitem(orders_id,fooditem_id, quantity)
VALUES ('1','1','2'),
       ('1','3','1'),
       ('2','2','1'),
       ('2','4','1'),
       ('3','5','2'),
       ('3','7','3'),
       ('3','9','4');
  


 

   



    

