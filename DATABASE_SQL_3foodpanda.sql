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
  PRIMARY KEY ( deliveryperson_id)
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
CREATE TABLE orders_fooditem(
   orders_id INT not null,
   fooditem_id  INT not null,
   quantity  INT ,
   PRIMARY KEY (orders_id , fooditem_id),
   FOREIGN KEY (orders_id) REFERENCES orders (orders_id),
   FOREIGN KEY (fooditem_id ) REFERENCES food_item (fooditem_id )
   );
 SELECT*FROM address;
INSERT INTO address(address_id, street, city, province)
VALUES ('1','292 Ba Trieu','Ha Noi',null),
	   ('2','26-28 Tran Phu','Nha Trang','Khanh Hoa'),
       ('3','132 Le Duan','Da Nang',null),
       ('4','101B Le Huu Trac','Da Nang',null),
       ('5','99 To Hien Thanh','Da Nang',null),
       ('6','47 Ngo Phat Loc','Ha Noi',null),
       ('7','34 Phan Phu Tien','Ha Noi',null);
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
       ('2','22-08-06 15:30:00',false,'1','1','1'),
       ('3','2022-03-21 8:10:00 ',false,'5','3','0'),
       ('4','2022-07-29 12:10:00',false,'2','3','1'),
       ('5','2022-08-06 19:25:03',true,'3','1',null);


select*from orders_fooditem;	
INSERT INTO orders_fooditem(orders_id,fooditem_id, quantity)
VALUES ('1','1','2'),
       ('1','3','1'),
       ('2','2','1'),
       ('2','4','1'),
       ('3','5','2'),
       ('3','7','3'),
       ('3','9','4'),
       ('4','2','1'),
	   ('5','1','2'),
       ('5','2','1');


select*from food_item 
where unit_price <= 70000 order by food_name asc;

select fooditem_id, food_name, unit_price from food_item where  unit_price >= 40000;

select*from food_item
where unit_price <=50000 or unit_price >= 90000;

select*from address;
 
select customer.customer_id,customer.firstname,customer.lastname,
customer.email,customer.phone,customer.address_id from customer,address
where address.city = 'Quang Nam' and address.street in ('Dong Da','Tran Phu')
and address.address_id = customer.address_id;


select * from customer,restaurant
where customer.address_id = restaurant.address_id;

select fooditem_id,food_name,unit_price from food_item 
where unit_price >= 40000;

select customer_id,firstname,lastname,email from customer 
order by firstname asc;

select fooditem_id,food_name,unit_price from food_item
order by food_name asc, unit_price desc;

select * from customer 
where firstname != 'LUC';

select*from food_item
where unit_price between 30000 and 70000;

-- -- --------------
-- Câu 1
select*from Customer
Where firstname = ' Alice' limit 2;
-- câu 2
select fooditem_id,sum(quantity) as 'so luong > 50' from orders_fooditem 
Group by fooditem_id having sum(quantity) > 1;
-- câu 4
select restaurant_name,max(x.myc) as 'solanmua' 
from restaurant,(select count(orders.RESTAURANT_ID) as myc from orders,restaurant 
where orders.RESTAURANT_ID=restaurant.RESTAURANT_ID 
group by(orders.RESTAURANT_ID))as x;
-- Câu 5
select *,count(orders.restaurant_id) from restaurant left join orders 
on restaurant.restaurant_id= orders.restaurant_id
where restaurant.restaurant_id= orders.restaurant_id 
and year(date_of_oders)=2022 and month(date_of_oders) between 7 and 8
 group by orders.restaurant_id
having count(orders.restaurant_id)= (select max(x.mycount) 
from (select count(restaurant_id) as mycount 
from orders where year(date_of_oders)=2022 and month(date_of_oders)
 between 7 and 8 group by restaurant_id) as x);
-- Câu 3
select*from food_item left join orders_fooditem 
on food_item.fooditem_id = orders_fooditem.fooditem_id 
Group by food_item.fooditem_id having sum(quantity)>50 order by food_name asc;
-- Câu 6
select delivery_person.deliveryperson_id,delivery_name,phone,vehicle from delivery_person,orders 
where delivery_person.deliveryperson_id = orders.deliveryperson_id 
group by delivery_person.deliveryperson_id;
-- Câu 7:
select customer.customer_id,lastname,firstname,email,phone,address_id,count(orders.customer_id) 
from customer, orders where customer.customer_id = orders.customer_id 
group by customer.customer_id order by count(orders.customer_id) 
 desc limit 10;
select*from orders;
-- Câu 10:
select restaurant.restaurant_id,restaurant_name,website,phone,address_id, avg(unit_price)
from restaurant, food_item where restaurant.restaurant_id = food_item.restaurant_id
Group by restaurant.restaurant_id having avg(unit_price) >= 70.000;











