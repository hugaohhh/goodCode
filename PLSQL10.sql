rollback ;
savepoint 1;
commit;
set AUTOCOMMIT ON; -- 设置自动提交事务

select sysdate from dual; -- 返回当前数据库本地时间
select TO_CHAR(CURRENT_DATE,'YYYY-MM-DD HH:MM:SS') from dual; -- 返回当前会话时间 并格式化
select add_months(sysdate,5) from dual; -- 返回当前时间加 5个月
select localtimestamp from dual; -- 返回当前会话时间，包括时分秒


begin
	dbms_output.put_line(user || ' tables in the database');
	for t in (select table_name from user_tables)
	loop 
		dbms_output.put_line(t.table_name);
	end loop;
end;
/
/**
DBMS_OUTPUT.DISABLE;
禁用消息输出。
DBMS_OUTPUT.NEW_LINE;
放置一个行尾标记

DBMS_OUTPUT.ENABLE(buffer_size IN INTEGER DEFAULT 20000);
启用消息输出。buffer_size设置为NULL值表示无限制的缓冲区大小。

*/

declare
	lines dbms_output.chararr;
	num_lines number;
begin
	dbms_output.enable;
	
	dbms_output.put_line('hello world');
	dbms_output.put_line('hello world2');
	dbms_output.put_line('hello world3');
	
	num_lines := 3;
	dbms_output.get_lines(lines,num_lines);
	
	for i in 1 .. num_lines loop
		dbms_output.put_line(lines(i));
	end loop;
end;
/

