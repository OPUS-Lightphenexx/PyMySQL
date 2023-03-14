#总结一下这里有primary key，auto_increment，not null，unique，check，default。(也许还有foreign key)

create database constraints;

create table constraints.table(
    test1 int primary key auto_increment,
    test2 varchar(3) not null unique,
    test3 int check ( test3>40 and test3<89 ),
    test4 varchar(1) default '1',
    test5 varchar(50) comment 'nothing'
);

#复习一下前面的
insert into constraints.table(test2,test3) values('4',55);
insert into constraints.table(test1, test2, test3, test4, test5) values(1,'ccc',55,'2',5);
select * from constraints.table;
alter table constraints.table drop test5;
alter table constraints.table add test5 int;
delete from constraints.table where test5 is null;
update constraints.table set test5=2 where test5 is null;
alter table constraints.table add test6 int;
alter table constraints.table modify test6 varchar(50);
update constraints.table set test6=2 where test1=3;
update constraints.table set test6=6 where test4>1;

#外键约束
#先创立两个关联表格
create table constraints.foreign_outer(
    test1 int primary key auto_increment,
    test2 varchar(50) not null
);
select * from constraints.foreign_outer;
insert into constraints.foreign_outer(test2) values('a');
insert into constraints.foreign_outer(test2, test3) value('b',1),('c',3),('d',4),('e',2);
alter table constraints.foreign_outer add test3 int not null;
update constraints.foreign_outer set test3=1 where test1=1

create table constraints.classify(
    id int auto_increment primary key,
    test1 varchar(20) not null unique
);
insert into constraints.classify(test1) values('一'),('二'),('三'),('四'),('五');
select * from constraints.classify;
select * from constraints.foreign_outer;

#开始添加外键
alter table constraints.foreign_outer add constraint what foreign key(test3) references constraints.classify(id);#这个是重点
delete from constraints.foreign_outer where test1=2;
insert into constraints.foreign_outer(test1,test2,test3) values(1,'a',3);
alter table constraints.foreign_outer drop foreign key what;#这个是重点
alter table constraints.foreign_outer add test4 int;
update constraints.foreign_outer set test4=4 where test4 is null;
delete from constraints.foreign_outer where test3=4;
update constraints.foreign_outer set test4=null where test1=3;
#所以总结一下
alter table constraints.foreign_outer add constraint testkey foreign key(test3) references constraints.classify(id);#这是加foreign key
alter table constraints.foreign_outer drop foreign key testkey;#这是删除foreign key
select * from constraints.classify;
select * from constraints.foreign_outer;

#外键删除更新行为
alter table constraints.foreign_outer add constraint testkey foreign key(test3) references constraints.classify(id) on update restrict on delete restrict;#no action 和restrict的用法
alter table constraints.foreign_outer drop foreign key testkey;
alter table constraints.foreign_outer add constraint testkeyother foreign key(test4) references constraints.classify(id) on update cascade on delete cascade;#这里注意动的是classify表,foreign表的行直接删除。
alter table constraints.foreign_outer drop foreign key testkeyother;
alter table constraints.foreign_outer add constraint testwhat foreign key(test4) references constraints.classify(id) on update set null on delete set null;#动的是null值
alter table constraints.foreign_outer drop foreign key testwhat;
#处理数据
delete from constraints.classify where id=3;
insert into constraints.classify(id, test1) values(3,'三');
insert into constraints.foreign_outer(test2,test3,test4) values('dd',4,2);
update constraints.foreign_outer set test4=4 where test4 is null;









