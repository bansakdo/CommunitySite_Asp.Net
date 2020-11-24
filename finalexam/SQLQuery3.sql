update board set name='user2', pass='asd', email='emm', title=N'첫 글 제목2', contents=N'첫 글 내용1', writedate='2020-11-14', category='free' where num=1;


modify table board ;


select * From ::fn_helpcollations() where name='Korean' *;


select @@LANGUAGE


select * from sys.databases;


Alter database Finalexam 
	collate Korean_Wansung_CI_AI
	GO
	ss

Alter table board
	Alter column title nvarchar(50) 
	collate Korean_Wansung_CI_AI
	Go
