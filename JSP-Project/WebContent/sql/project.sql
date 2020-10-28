create table reviewBoard(
num int not null auto_increment,
p_id varchar(20) not null,
p_name varchar(20) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit intint default 0,
p_fileName varchar(20),
star varchar(10) not null,
primary key (num)
) default charset=utf8;

desc reviewBoard;

delete from reviewBoard;

select * from reviewboard;

delete from reviewboard where num=61;

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName,star) 
values('asdasdasd','Outter','Real Review!!','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis enim magna. Vivamus pharetra auctor libero quis volutpat. Aenean vel purus cursus, convallis felis eget, maximus turpis. Nunc sodales ligula nunc, eget fermentum ligula suscipit sit amet. Maecenas ultrices tempor fringilla. Donec a tristique libero, rutrum tempus eros. Etiam pellentesque dignissim tem','2020-07-29','0','cloth_1.jpg','★★★★★');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('kim','Bottom','Wow Very Good!!','Suspendisse suscipit finibus metus eget mattis. Mauris vehicula orci in sodales aliquam. Etiam at dui quis risus consequat commodo. Quisque gravida suscipit placerat. Praesent euismod nisl metus, nec ultrices neque interdum aliquet. Integer id mi eu lacus tincidunt pulvinar. Nullam ac bibendum nunc. Mauris ac metus iaculis, tempor lib','2020-07-29','0','cloth_2.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('lee','Shoes','Real Review!!','Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam in nisi quis dolor placerat laoreet. Aenean nec tellus magna. Aenean vulputate augue sit amet ornare condimentum. Praesent sed consectet','2020-07-29','0','cloth_3.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('park','Bottom','Real Review!!','Sed dignissim nibh libero, id commodo eros hendrerit at. Fusce eget molestie ante. Morbi ullamcorper malesuada tellus eu feugiat. Maecenas vel metus a orci rutrum placerat ut ut lacus. Vivamus varius sapien eleifend tincidunt varius. Ut eu maximus tellus. Phasellus accumsan diam sed eros porta scelerisque. Suspendisse vel laore','2020-07-29','0','cloth_1.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('han','Top','Wow Very Good!!','Nulla efficitur feugiat nisi, ut finibus enim finibus nec. Mauris dapibus, nisi a sagittis interdum, tellus lorem congue nisl, id condimentum tortor eros sed sem. Donec felis lacus, pretium eget est id, tincidunt euismod diam. Etiam non sodales ipsum, a semper odio. Aenean pulvinar, sem id tincidunt lacinia, risus quam elementum lacus, eu hendrerit d','2020-07-29','0','cloth_2.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('ha','Bottom','Real Review!!','Sed eget pulvinar nunc. Suspendisse interdum feugiat risus in aliquet. Proin non purus non libero facilisis pretium. Quisque a sodales tellus. Integer sodales nulla vitae ante mattis dignissim. Nullam volutpat lacinia dapibus. Donec ','2020-07-29','0','cloth_3.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('hong','Outter','Real Review!!','Sed dictum, turpis sit amet maximus suscipit, enim felis mattis neque, a facilisis turpis lacus a eros. Praesent ultricies lectus mauris, quis sollicitudin magna aliquam in. Duis eu luctus ante. Etiam mattis sem sit amet odio auctor lacinia. Cras felis nibh, commodo vitae lectus nec, laoreet varius arcu. Nunc vitae vo','2020-07-29','0','cloth_1.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('kim','Bottom','Wow Very Good!!','tiam maximus tincidunt diam, vel convallis leo porta vitae. Aliquam dapibus urna eget mattis ullamcorper. Curabitur dictum, risus sed feugiat posuere, velit ligula scelerisque sapien, id tempus sapien arcu id orci. In porta condimentum tristique. Donec finibus nibh dolor, condimentum cursus urna eleifend quis. ','2020-07-29','0','cloth_2.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('yoon','Shoes','Real Review!!','Vestibulum venenatis eros libero, in imperdiet diam lacinia eu. Quisque condimentum urna diam, in hendrerit augue molestie a. Aliquam tempor augue ut magna aliquet vehicula. Ma','2020-07-29','0','cloth_3.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('lee','Bottom','Wow Very Good!!','Pelrper u magna tempor, urtor dapibus et. Nunc aliquet gravid','2020-07-29','0','cloth_1.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('han','Top','Real Review!!','fringilla tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus finibus aliquet lectus quis efficitur. Curabitur ac laoreet arcu. Aliquam placerat, justo fermentum egestas iaculis, mauris nibh pulvinar nunc, eget ullamcorper tortor quam id est. Praesent vel velit ac urna rhoncus ac','2020-07-29','0','cloth_2.jpg');

insert into reviewBoard(p_id,p_name,subject,content,regist_day,hit,p_fileName) 
values('han','Shoes','Real Review!!','Nam vehicula suscipit purus non luctus. Donec laoreet eros purus, sed varius velit ullamcorper eu. Nulla ut nisl sit amet urna rhoncus sagittis. Nunc placerat, ipsum sit amet luctus vulputate, massa nunc volutpat quam, mattis eleifend sem erat ac nibh. Maecenas venenatis posuere magna sed imperdiet. Vivamus aucto','2020-07-29','0','cloth_3.jpg');

select count(*) from reviewBoard;

select * from reviewBoard where productname = 'Outter';

desc reviewBoard;

alter table reviewBoard modify hit int default 0;

create table reviewBoard(
num int not null auto_increment,
p_id varchar(20) not null,
p_name varchar(20) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit int,
p_fileName varchar(20),
primary key (num)
) default charset=utf8;

create table qnaBoard(
num int not null auto_increment,
id varchar(20) not null,
p_name varchar(20) not null,
qnapassword int(4) not null,
qnacategory varchar(10) not null,
content text not null,
regist_day varchar(30),
result int not null,
answer text,
primary key(num)
)default charset=utf8;

desc qnaBoard;
select * from qnaBoard order by num desc;

insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day,result) 
values('han1dragon','Membrana Hoody',5212,'size','size is big??','2020-08-01',0);

insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day,result) 
values('xocivuj','afsgasd',1234,'color','color is big??','2020-08-01',0);

insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day,result) 
values('wetgsdf','xcvr',2345,'size','size is big??','2020-08-01',0);

insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day,result) 
values('negdfg','cvbefa',3456,'shipping','shipping is big??','2020-08-01',0);

insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day,result) 
values('qwesdg','Mwefsd',4567,'color','color is big??','2020-08-01',0);

desc qnaBoard;

drop table qnaBoard;
create table qnaCategory(
categoryname varchar(10) not null,
description varchar(20)
) default charset=utf8;

insert into qnaCategory(categoryname,description) values('size','inquiry of size');
insert into qnaCategory(categoryname,description) values('color','inquiry of color');
insert into qnaCategory(categoryname,description) values('shipping','inquiry of shipping');

select * from qnaCategory;

alter table reviewBoard add star varchar(10) not null; 

insert into reviewBoard(star) values('★★★★★') where hit=0;

update reviewBoard set star='★★★★★' where hit=0;

create table delivery(
seq int not null auto_increment,
c_fname varchar(20) not null,
postcode varchar(20) not null,
address varchar(100) not null,
detailaddress varchar(100) not null,
c_email_address varchar(100) not null,
c_phone varchar(50) not null,
c_order_notes varchar(200) not null,
primary key(seq)
) default charset=utf8;

select * from delivery;
select * from reviewBoard;

alter table delivery drop shippingmsg;
delete from reviewBoard where num=26;

select p_name from product
select description from qnaCategory

select * from qnaboard;
desc qnaBoard;
alter table qnaBoard modify qnacategory varchar(30) not null;
alter table qnaBoard modify result varchar(4) not null default 'NO';
alter table qnaBoard modify answer text default none;
alter table qnaBoard modify qnapassword varchar(4) not null;

update qnaBoard set result='NO' where regist_day='2020-08-02';

select * from qnaboard;

alter table qnaBoard add answer text;

desc qnaBoard;

select id,p_name,qnacategory,content from qnaBoard where num=10;
update qnaBoard set result=? answer=? where num=?

select * from qnaBoard where num=15

select * from member;
select * from qnaBoard where num = 1;
select status from sale order by seq;

select * from sale;

select (CASE when status = 1 then 'Order completed'
when status = 2 then 'Preparing for delivery' when status = 3 then 'Shipping in progress' when status = 4 then 'Delivery completed'
when status = 5 then 'Receipt completed' end) as statuscase from sale order by seq

