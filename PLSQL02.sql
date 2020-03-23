declare 
-- 全局变量
	num1 number := 95;
	num2 number := 85;
begin

	dbms_output.put_line('num1 : ' || num1); -- 95
	dbms_output.put_line('num2 : ' || num2); -- 85
	declare
	-- 局部变量
		num1 number := 195;
		num2 number := 185;
	begin
		dbms_output.put_line('num1 : ' || num1); -- 195
		dbms_output.put_line('num2 : ' || num2); -- 185
	end;
	
end; 
/

declare 

	c_id customer.id%type := 1;
	c_name customer.name%type;
	c_addr customer.address%type;
	c_sal customer.salary%type;
begin

	select name,address,salary INTO c_name,c_addr,c_sal
	FROM customer
	WHERE id = c_id;
	dbms_output.put_line('customer '||c_name || 'from ' || c_addr)
	
end; 
/

declare 
	message varchar2(30) := 'hello'' world';
begin

end;
/

SET aa ON SIZE 1000000;
declare
	i number(1);
	j number(1);
begin
	<< outer_loop >>
	FOR i IN 1..3 LOOP
		<< inner_loop >>
		FOR j IN 1..3 LOOP
			dbms_output.put_line('i is ' || i || ' and j is ' || j);
		end loop inner_loop;
	end loop outer_loop;

end;
/

