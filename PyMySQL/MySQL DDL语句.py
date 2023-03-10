import pymysql

db = pymysql.connect(user="root",password="nogive!")

cursor = db.cursor()

#数据库DDL操作
#选择数据库(查询最好在mysql里面进行)
use_database = 'use ddl;'#这个是要首先选择的
cursor.execute(use_database)
test = 'select database();'
cursor.execute(test)
#创建数据库
sql_create_database = 'create database if not exists python;'
cursor.execute(sql_create_database)
utf8 = 'create database if not exists python default charset utf8'
#删除数据库
sql_drop = 'Drop database python;'
cursor.execute(sql_drop)
#避免报错创建数据库
sql_create_database1 = 'create database if not exists python;'
cursor.execute(sql_create_database1)
sql_drop = 'drop database if exists python'
cursor.execute(sql_drop)

create_python_dataset = 'create database python;'
cursor.execute(create_python_dataset)
#表格DDL操作
#show tables 的操作((查询最好在mysql里面进行))
#sql_show_table = 'use ddl;' \
                 #'select database();' \
                 #'show tables;'
#cursor.execute(sql_show_table)
#创建表格
select_database = 'use ddl;'
cursor.execute(select_database)
create_table = 'create table test(' \
               'test1 int,' \
               'test2 varchar(50));'
cursor.execute(create_table)
#查看表格结构
desc_table = 'desc test;'
cursor.execute(desc_table)


#数据类型的设置
create_table_datatype = 'create table datatype(' \
                        'test1 int,' \
                        'test2 bigint,' \
                        'test3 tinyint,' \
                        'test4 smallint,' \
                        'test5 mediumint,' \
                        'test6 decimal,' \
                        'test7 float);'
cursor.execute(create_table_datatype)

#字符串类型的设置(tinyblob是不超过255个字符的二进制数据)
create_table_string = 'create table str(' \
                      'test1 char,' \
                      'test2 varchar(60),' \
                      'test3 tinyblob,' \
                      'test4 tinytext,' \
                      'test5 blob,' \
                      'test6 text,' \
                      'test7 mediumblob,' \
                      'test8 mediumtext,' \
                      'test9 longblob,' \
                      'test10 longtext);'

cursor.execute(create_table_string)

#创建日期类型的表格
create_table_time = 'create table time(' \
                    'test1 date,' \
                    'test2 time,' \
                    'test3 year,' \
                    'test4 datetime,' \
                    'test5 timestamp);'
cursor.execute(create_table_time)

#添加字段(以test表格为例子)
test_table_add = 'alter table test add test3 varchar(50);'
cursor.execute(test_table_add)

#修改数据类型
test_table_modify = 'alter table test modify test3 int;'
cursor.execute(test_table_modify)

#change修改
test_table_change = 'alter table test change test3 newtest3 varchar(50);'
cursor.execute(test_table_change)

#删除一个字段
test_table_drop_column = 'alter table test drop test2;'
cursor.execute(test_table_drop_column)

#在另外一个database里面加入表格(题外话了)
test_table_other_database = 'create table python.time(' \
                            'test1 int);'
cursor.execute(test_table_other_database)

#修改表的名字的名称
test_table_rename = 'alter table test rename to renametest'
cursor.execute(test_table_rename)

#删除表
create_first_database = 'create database onlytest;'
create_first_table = 'create table onlytest.onlytest(' \
                     'onlytest int);'
delete_table = 'drop table if exists onlytest.onlytest'
cursor.execute(create_first_database)
cursor.execute(create_first_table)
cursor.execute(delete_table)

#删除指定表,并重新创建该表(???)
create_first_table1 = 'create table onlytest.onlytest(' \
                     'onlytest int);'
truncate_table = 'truncate table onlytest.onlytest'
cursor.execute(create_first_table1)
cursor.execute(truncate_table)







