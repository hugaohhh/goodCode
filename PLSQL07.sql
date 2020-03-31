
declare
	c_id customers.id%type := 100;
	c_name customers.name%type;
	c_addr customers.address%type;
begin
	select name,address into c_name,c_addr
	from customers
	where id = c_id;
	DBMS_OUTPUT.PUT_LINE ('姓名: '||  c_name); 
   DBMS_OUTPUT.PUT_LINE ('地址: ' || c_addr); 
exception 
	when no_data_found then
		dbms_output.put_line('not found customers');
	when others then
		dbms_output.put_line('Error');
end;
/

-- 自定义异常示例
DECLARE 
   exception_name EXCEPTION; 
BEGIN 
   IF condition THEN 
      RAISE exception_name; 
   END IF; 
EXCEPTION 
   WHEN exception_name THEN 
   statement; 
END;

SET SERVEROUTPUT ON SIZE 9999;
DECLARE 
   c_id customers.id%type := &cc_id; -- 输入
   c_name  customerS.name%type; 
   c_addr customers.address%type; 
   -- 自定义异常
   ex_invalid_id EXCEPTION;
begin
	if c_id <= 0 then
		raise ex_invalid_id;
	else
		select name,address into c_name,c_addr
		from customers
		where id = c_id;
		DBMS_OUTPUT.PUT_LINE ('姓名: '||  c_name); 
	   DBMS_OUTPUT.PUT_LINE ('地址: ' || c_addr);
	end if;
exception 
	when ex_invalid_id then	
		dbms_output.put_line('编号ID必须大于0');
	when no_data_found then
		dbms_output.put_line('not found customers');
	when others then
		dbms_output.put_line('Error');
end;
/


	