-- 触发器（trigger）  的创建
create or replace trigger display_salary_changes
before delete or insert or update on customers
for each row
when (NEW.ID > 0)
declare
	sal_diff number;
begin
	sal_diff := :NEW.salary - :OLD.salary;
	dbms_output.put_line('Old salary: ' || :OLD.salary);
	dbms_output.put_line('NEW salary: ' || :NEW.salary);
	dbms_output.put_line(' salary defference: ' || sal_diff);
end;
/

-- 创建程序包
SET SERVEROUTPUT ON SIZE 99999;
CREATE PACKAGE cust_sal AS 
   PROCEDURE find_sal(c_id customers.id%type); 
END cust_sal; 
-- 创建程序包体
create or replace package body cust_sal AS
	procedure find_sal(c_id customers.id%type) IS
	c_sal customers.salary%type;
	begin
		select salary into c_sal
		from customers
		where id = c_id;
		dbms_output.put_line('Old salary: ' || c_sal);
	end find_sal;
end cust_sal;
/

-- 使用程序包
declare
	code customers.id%type := &cc_id;
begin
	cust_sal.find_sal(code);
end;
/















