/* 회원정보 관리 */
create table member(
id varchar(10) not null,
password varchar(10) not null,
name varchar(10) not null,
gender varchar(4),
birth varchar(20),
mail varchar(30),
phone varchar(20),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
extraAddress varchar(50),
regist_day varchar(50),
primary key(id)
)default charset = utf8;

insert into member values('admin','admin1234','admin','Man','2020-08-04','admin@naver.com','999-9999-9999','12345','admin','admin','admin','2020-08-04');
insert into member values('test1','1234','test1','Man','2020-08-04','test1@naver.com','999-9999-9999','12345','test1','test1','test1','2020-08-04');
insert into member values('test2','1234','test2','Man','2020-08-04','test2@naver.com','999-9999-9999','12345','test1','test1','test1','2020-08-04');

select * from member;

create table product(
p_id varchar(10),
p_name varchar(20),
p_unitPrice int,
p_description text,
p_category varchar(20),
p_unitsInStock mediumtext,
p_fileName varchar(20)
)default charset=utf8;

create table category(
seq int not null auto_increment,
categoryName varchar(20) not null,
description varchar(30),
primary key(seq)
)default charset=utf8;

insert into category(categoryName,description) values('Outer','Outer');
insert into category(categoryName,description) values('Backpack','Backpack');
insert into category(categoryName,description) values('Glasses','Glasses');
insert into category(categoryName,description) values('Watch','Watch');
insert into category(categoryName,description) values('Ring','Ring');

create table qnaCategory(
categoryname varchar(10) not null,
description varchar(20)
) default charset=utf8;

insert into qnaCategory(categoryname,description) values('size','inquiry of size');
insert into qnaCategory(categoryname,description) values('color','inquiry of color');
insert into qnaCategory(categoryname,description) values('shipping','inquiry of shipping');

create table qnaBoard(
num int not null auto_increment,
id varchar(20) not null,
p_name varchar(20) not null,
qnapassword varchar(4) not null,
qnacategory varchar(30) not null,
content text not null,
regist_day varchar(30),
result varchar(4) not null default 'NO',
answer text,
primary key(num)
)default charset=utf8;


create table reviewBoard(
num int not null auto_increment,
p_id varchar(20) not null,
p_name varchar(20) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit int default 0,
p_fileName varchar(20),
star varchar(10) not null,
primary key (num)
) default charset=utf8;

create table delivery(
seq int not null auto_increment,
id varchar(20) not null,
c_fname varchar(20),
postcode varchar(20),
address varchar(100),
detailaddress varchar(100),
c_email_address varchar(100),
c_phone varchar(50),
c_order_notes varchar(200),
primary key(seq)
)default charset=utf8;

create table sale(
seq int not null auto_increment,
id varchar(20) not null,
saledate varchar(30),
sessionId varchar(50),
productId varchar(20),
unitprice int,
saleqty int,
status varchar(30) default 'Order completed',
primary key(seq)
)default charset=utf8;
drop table sale;

insert into product values('A1000','Membrana Hoody',790,'20SS Stone MEMBRANA Hoody Navy','Outer','100','A1000.jpg');
insert into product values('A1001','Wool Blazer Jacket',500,'Grey Oversized Wool Blazer Jacket','Outer','200','A1001.jpg');
insert into product values('A1002','MontBlanc Watch',4500,'Timewalker Worldtime Autometic Watch','Watch','100','A1002.jpg');
insert into product values('A1003','Tag Heuer Watch',4400,'Aquaracer Mens Metal Watch','Watch','100','A1003.jpg');
insert into product values('A1004','Gucci Watch',4400,'G-Frame Diamond Dial Quatz Watch','Watch','100','A1004.jpg');
insert into product values('A1005','Omega Watch',3400,'De Ville Prestige Metal Watch','Watch','100','A1005.jpg');
insert into product values('A1006','Mathey-Tissot Watch',2500,'Mathey-Tissot AM1886PZ Watch','Watch','100','A1006.jpg');
insert into product values('A1007','Covernat Authentic',110,'Reversible Fleece Zip-Up Jacket','Outer','100','A1007.jpg');
insert into product values('A1008','AnderssonBell Jacket',170,'James Contrast Top Bomber Jacket','Outer','100','A1008.jpg');
insert into product values('A1009','Thom Browne Jacket',1700,'Mens Wool Cardigan Jacket','Outer','100','A1009.jpg');
insert into product values('A1010','Neil Barrett Coat',1900,'2383 Mens Slim-Fit Coat','Outer','100','A1010.jpg');
insert into product values('A1011','Moncler Backpack',1020,'Doppin Large Unisex Backpack','Backpack','100','A1011.jpg');
insert into product values('A1012','Burberry Backpack',950,'Vintage Check Jett Unisex Backpack','Backpack','100','A1012.jpg');
insert into product values('A1013','Supreme Backpack',760,'Supreme x Stone Island Camo Backpack','Backpack','100','A1013.jpg');
insert into product values('A1014','Moncler Backpack',730,'Genius Fragment 0061200 Mens Backpack','Backpack','100','A1014.jpg');
insert into product values('A1015','Dior Glasses',650,'Dior 0215F Glasses TSJ Safilo Korea','Glasses','100','A1015.jpg');
insert into product values('A1016','Fendi Glasses',500,'Fendi Glasses FF 0329 J5G Safilo Korea','Glasses','100','A1016.jpg');
insert into product values('A1017','Givenchy Glasses',490,'Givenchy GV 0088/F 807 Glasses','Glasses','100','A1017.jpg');
insert into product values('A1018','OliverGold Glasses',480,'OG x OliverGoldSmith Ralph Tortoise','Glasses','100','A1018.jpg');
insert into product values('A1019','Gucci Glasses',430,'Unisex Fashion Glasses GG0127O 002_N','Glasses','100','A1019.jpg');
insert into product values('A1020','AgingCCC Rings',2800,'393 Classic Celebration Rings-White Gold','Ring','100','A1020.jpg');
insert into product values('A1021','Blendoff Rings',1400,'Blendoff aube brume Couple Rings 14k','Ring','100','A1021.jpg');
insert into product values('A1022','JEstina Rings',720,'JEstina Mariebel 14k Rings','Ring','100','A1022.jpg');
insert into product values('A1023','Gucci Rings',1100,'Gucci Icon Blossom 18k Rose-Rings','Ring','100','A1023.jpg');
insert into product values('A1024','Metrocity Rings',630,'Mens Iternita 14k Couple-Rings','Ring','100','A1024.jpg');

show tables;

drop table category;
drop table delivery;
drop table qnaboard;
drop table qnacategory;
drop table reviewboard;
drop table sale;
drop table ;

create table statusCategory(
seq int(4) not null,
categoryname varchar(30) not null,
description varchar(30)
)default charset=utf8;

drop table statusCategory;

select * from statusCategory;

select * from sale;

insert into statusCategory values(1,'Order completed','Order completed');
insert into statusCategory values(2,'Preparing for delivery','Preparing for delivery');
insert into statusCategory values(3,'Shipping in progress','Shipping in progress');
insert into statusCategory values(4,'Delivery completed','Delivery completed');
insert into statusCategory values(5,'Receipt completed','Receipt completed');

desc sale;

select id,p_id,seq,p_name,saledate,sessionId,unitprice,status,saleqty,p_fileName from product p, sale s where p.p_id = s.productId;
