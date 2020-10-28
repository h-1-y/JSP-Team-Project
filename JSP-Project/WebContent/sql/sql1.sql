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

select * from delivery;
select * from sale;


drop table delivery;
drop table sale;
/* sale 테이블 생성 */

create table sale(
seq int not null auto_increment,
id varchar(20) not null,
saledate varchar(30),
sessionId varchar(50),
productId varchar(20),
unitprice int,
saleqty int,
status int default 1,
primary key(seq)
)default charset=utf8;

select * from sale;
drop table sale;
update sale set status=1;
select id,p_id,seq,p_name,saledate,sessionId,unitprice,status,saleqty,p_fileName,(CASE when status = 1 then 'Order completed'
when status = 2 then 'Preparing for delivery' when status = 3 then 'Shipping in progress' when status = 4 then 'Delivery completed'
when status = 5 then 'Receipt completed' end) as statuscase from product p, sale s where p.p_id = s.productId and s.id = 'han1dragon';

desc sale;
desc qnaBoard;
