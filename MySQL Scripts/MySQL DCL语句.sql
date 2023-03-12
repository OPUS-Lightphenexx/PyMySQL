Use mysql;

select * from user;

#创建在主机上面的用户名
create user 'lightphenexx'@'localhost' identified by '211393Hour';

#在任意主机上
create user 'iert29'@'%' identified by '12345';

#修改密码
alter user 'lightphenexx'@'localhost' identified with mysql_native_password by 'testhour';

drop user 'iert29'@'%';

#权限设置(多个权限使用逗号)
show grants for 'iert29'@'%';
show grants for 'lightphenexx'@'localhost';

grant select on mysql.db to 'lightphenexx'@'localhost';
grant delete on mysql.db to 'iert29'@'%';

grant all on mysql.db to 'lightphenexx'@'localhost';
revoke all on mysql.db from 'lightphenexx'@'localhost';#这里注意revoke是from





