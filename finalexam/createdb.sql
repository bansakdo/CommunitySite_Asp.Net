create table board (
	num		int identity(1, 1) primary key,
	name	nvarchar(10),
	pass	nvarchar(10),
	email	varchar(20),
	title	nvarchar(50),
	contents	ntext,
	writedate	varchar(20),
	readcnt		int
)


select * from board;


create table users (
	u_id			nvarchar(10),
	u_password	nvarchar(20),
	u_name		nvarchar(10),
	u_email		varchar(20),
);

select * from users;