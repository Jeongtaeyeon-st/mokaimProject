create table usr(
	_usr_num int primary key,
	_usr_email varchar(128) unique,
	_usr_pw varchar(128)
)

create table post(
	_post_num int primary key,
	_post_title varchar(128),
	_post_content varchar(1024),
	_post_usr varchar(128),
	
	foreign key (_post_usr) references usr(_usr_email)
)

create table img(
	_img_num int primary key,
	_img_name varchar(512),
	_img_location varchar(512),
	_img_source int,

	foreign key (_img_source) references post(_post_num)
)


CREATE SEQUENCE seq
AS int     
START WITH 1 
INCREMENT BY 1       
MINVALUE 1 
MAXVALUE 2147483647  
CACHE
GO


select next value for seq;

INSERT Test.Orders (OrderID, Name, Qty)  
    VALUES (NEXT VALUE FOR Test.CountBy1, 'Tire', 2) ;  

    https://docs.microsoft.com/ko-kr/sql/relational-databases/sequence-numbers/sequence-numbers?view=sql-server-ver15



create table comments(
	comments_id int primary key default(next value for s1),
	usr_id varchar(20),
	comments_content varchar(128),
	reg_date date,
	
	foreign key (usr_id) references usr(usr_id) on delete cascade on update cascade
	
);

create table reply(
	reply_id int,
	usr_id varchar(20),
	comments_id int,
	reply_content varchar(128),
	reply_date date,
	
	foreign key (usr_id) references usr(usr_id) on delete cascade on update cascade,
	foreign key (comments_id) references comments(comments_id) on delete cascade on update cascade
);

create sequence s1 start with 1 minvalue 1 maxvalue 1000 increment by 1 cache 1000 nocycle engine=Aria;

insert into comments (usr_id,comments_content,reg_date) values("admin","test","2020-07-22");