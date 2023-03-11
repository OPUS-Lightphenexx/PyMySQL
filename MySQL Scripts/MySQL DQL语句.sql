create database dql;
create table dql.dql(test1 int,test2 varchar(40),test3 int);
alter table dql.dql add test4 int;
insert into dql.dql(test1, test2, test3, test4) values(1,'a',1,1),(2,'b',2,2);
select * from dql.dql;
insert into dql.dql(test1) values(2);
insert into dql.dql(test1, test2, test3, test4) values(3,'c',3,3);
#select
select test1 from dql.dql;
select test1 as test1a, test2 as test2a from dql.dql;
#不重复查询
select distinct test1 from dql.dql;
insert into dql.dql(test2) values('liketest'),('noekdl');
delete from dql.dql where test2 = 'a';

#where
select distinct test1, test2, test3, test4 from dql.dql where test1 between 1 and 2;#between ... and 用法

select test2,test3 from dql.dql where test2 is null;
select test2,test3 from dql.dql where test2='c' and test3=3;
select test2 from dql.dql where test2='c' or test3 = 4;#有一个是错的,但不影响
select test1,test2,test3,test4 from dql.dql where test2 is not null;#还有一个用法？
select * from dql.dql where test1 is null and test2 = 'liketest';
#in类别
select test1,test2 from dql.dql where test2 in('b');#指定有哪些
select * from dql.dql where test1 in(2,3);
#like类别
select * from dql.dql where test2 like '______';#模糊查询,这里是指有六个数字的
select * from dql.dql where test2 like '%t';#这里指最后一个字
select * from dql.dql where test2 like 'l%';#这里指第一个字

#聚合函数

alter table dql.dql add test5 int;
#聚合函数开始
select max(test3) from dql.dql;
select min(test3) from dql.dql;
select count(test1) from dql.dql;
select avg(test1) from dql.dql;
select sum(test1) from dql.dql;
#来个和where函数结合的
select sum(test3) from dql.dql where test1 = 2;

#分组查询
select test1,count(*) from dql.dql group by test1;
select count(distinct test1) from dql.dql;
select test1 from dql.dql group by test1;
select * from dql.dql;
select count(*) from dql.dql group by test1;
select test1 from dql.dql group by test1;
insert into dql.dql(test1, test2, test3, test4, test5) values(4,'v',4,5,6);
select test1,count(*) as adress from dql.dql where test1<4 group by test1 having count(*)<2;

#排序查询(asc为升序,desc为降序)
select * from dql.dql;
insert into dql.dql(test1, test3, test4, test5) values(5,6,7,8),(6,7,8,9),(7,8,9,10),(8,9,10,11);
insert into dql.dql(test1, test3, test4, test5) values(8,9,11,12),(8,9,12,13);
insert into dql.dql(test1, test3, test4, test5) values(8,9,11,12),(8,9,11,12);
select * from dql.dql order by test3 , test4 desc,test5;#test3有相同的就对test4处理,test4相同的就对test5进行处理。以此类推。

#补全空缺null值
update dql.dql set test2=1 where test2 is null;
update dql.dql set test5=3 where test5 is null;

#limit用法(索引计算方法=(页面数-1)*显示每页的记录数)
select * from dql.dql;
select * from dql.dql limit 10;
select * from dql.dql limit 5;




