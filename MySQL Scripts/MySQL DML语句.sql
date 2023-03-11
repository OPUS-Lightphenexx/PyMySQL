use ddl;
#创建dml数据库
create database dml;
create table dml.train(test1 int,test2 varchar(50));
alter table dml.train add test3 int;
#insert语句
insert into renametest(test1) values(2);
insert into renametest(test1,test2) values(2,5);
insert into renametest(newtest3) values('a');
insert into renametest(test1, newtest3, test2) value(1,'test',2);
insert into renametest values(1,'testagain',3);
create table python.testpython(test1 int);
insert into renametest(test1, newtest3, test2) values(1,'multi',2),(1,'multi',2),(1,'multi',2),(1,'multi',2),(1,'multi',2);
SELECT * FROM ddl.renametest;

#update
insert into dml.train values(1,'old',3);
insert into dml.train values(1,'a',1),(1,'a',1),(1,'a',1),(1,'a',1);
update dml.train SET test1=2,test2='b',test3=2;#这个是没有where条件的
update dml.train set test1=3 where test1=2;
update dml.train set test2= 'new' where test1=1;
update dml.train set test2= 'newagain',test3=4 where test1=1;

select * from dml.train;
update dml.train set test3=1 where test1=1;

#delete
delete from dml.train where test1 = 3;
insert into dml.train(test1, test2, test3) values(2,'test',2),(3,'test',3),(4,'test',4);
delete from dml.train where test1=4;

