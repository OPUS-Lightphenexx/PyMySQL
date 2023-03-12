#这一节结合另外一个PyMySQL python程序进行的

#选择数据库(查询最好在mysql里面进行)
use ddl;

#创建数据库
create database if not exists python;

#删除数据库
Drop database python;

#避免报错创建数据库
create database if not exists python;drop database if exists python;

#表格DDL操作
#show tables 的操作((查询最好在mysql里面进行))
use ddl;select database();show tables;

#创建表格
#create table test( 
               #test1 int, 
               #test2 int);
               
#desc test;
#show create table test;#创建时候的结构
desc datatype;
desc str;
desc time;
desc renametest;
