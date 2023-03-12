#一些基础设置(相当于复习)
create database testfunction;
create table testfunction.testtable(test1 int,test2 int, test3 int);
insert into testfunction.testtable(test1, test2, test3) values(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
select * from testfunction.testtable;
insert into testfunction.testtable(test1) values(1);
update testfunction.testtable set test2=1 where test2 is null;
select test1 from testfunction.testtable order by test1 asc;
alter table testfunction.testtable add test4 varchar(50);
alter table testfunction.testtable add test5 varchar(50);
update testfunction.testtable set test4='a' where test1 = 1;
update testfunction.testtable set test4='b' where test1 = 2;
update testfunction.testtable set test4='c' where test1 = 3;
update testfunction.testtable set test4='d', test5='d' where test1=4;
update testfunction.testtable set test5='test' where test1 in(1,2,3,4,5,6);

drop table testfunction.testtable;
#函数开始
#字符串函数(虽然但是我感觉还是有点奇怪)
select concat('what',' ','the');
select lower('WHATTHE');
select upper('djejdjJJDKEJ');
select lpad('test',6,'what');
select rpad('test',6,'o');
select trim(' what the ');
select substring('one and two',1,6);
#如何使用字符串函数(终于来了,注意这里必须是str类型)
alter table testfunction.testtable add test6 varchar(50);
update testfunction.testtable set test6 = '3' where test1 in(3);
update testfunction.testtable set test6 = lpad(test6,5,'0000');
select * from testfunction.testtable;
update testfunction.testtable set test4=upper(test4);

#数值函数
select ceil(1.1);
select floor(1.1);
select mod(5,4);#这里返回的是余数,害怕看不懂:?
select rand();
select round(2.456,2);#保留好多位小数(四舍五入过后)
#如何使用
select lpad(round(rand()*1000000,0),6,1);#这个的目的就是为了让其放到左边?


#日期函数
select curdate();#返回当前的日期(就是现在！！)
select curtime();
select now();#返回日期和时间
select year(now());#获取所选择的time形式的年份
select month(now());
select day(now());
select date_add(now(),interval 70 day);#意思是从现在开始返回70天过后的日期
select datediff(now(),date_add(now(),interval 70 day));#两个天数之差


#流程函数
select if(false,'true','false');
select ifnull('nonull','what');#这其实是一个流程,如果第一个是null就返回下一个，下一个如果是null就真的是null了
select ifnull(null,'hahame');
select ifnull(null,null);
#case when then else用法(难点来咯)
select * from testfunction.testtable;
select test1,case test5 when '1' then 'new' else 'what' end from testfunction.testtable
#下面通过一个案例来说明
create table testfunction.practice (
    id int,
    name varchar(20),
    math int,
    english int,
    chinese int
);
insert into testfunction.practice(id, name, math, english, chinese) values(1,'a',20,59,90),(2,'b',69,65,56),(3,'c',56,85,78),(4,'d',56,74,56),(5,'e',56,78,89),(6,'f',58,86,78);
select * from testfunction.practice;
#看个例子应该就懂了
select id,
       name,
       (case when math>60 then '及格' when math>80 then '优秀' else '垃圾' end)'数学',
       english '英语',
       (case when chinese>80 then '大佬' else '垃圾' end) '垃圾语文'
from testfunction.practice;








