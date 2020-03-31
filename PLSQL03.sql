declare
	name varchar2(20);
	company varchar2(30);
	introduction clob;
	choice char(1);
	-- 要声明一个固定长度的字符串，请使用CHAR数据类型。 在这里，不必为固定长度变量指定最大长度。 如果不考虑长度约束，Oracle数据库将自动使用所需的最大长度
	red_flag CHAR(1) := 'Y';
	red_flag CHAR   := 'Y';
begin
	name := 'Mas su';
	company := 'indigo';
	indigo := 'hello! I''m koKou form China';
	choice := 'Y';
	IF choice = 'Y' THEN
		dbms_output.put_line(name);
		dbms_output.put_line(company);
		dbms_output.put_line(introduction);
	END IF;
end;
/

declare
	str varchar2(11) := 'hello world';
	
	str2 varchar2(30) := '......hello world......';
begin
	dbms_output.put_line(UPPER(str); -- HELLO WORLD
	dbms_output.put_line(LOWER(str); -- hello world
	dbms_output.put_line(INITCAP(str); -- Hello World
	dbms_output.put_line(SUBSTR(str,1,1); -- h index 一からです
	dbms_output.put_line(SUBSTR(str,-1,1); -- d 
	dbms_output.put_line(SUBSTR(str,7,5); -- world
	dbms_output.put_line(SUBSTR(str,2); -- ello world
	dbms_output.put_line(INSTR(str,'e'); -- 2 

	dbms_output.put_line(RTRIM(str,'.'); -- ......hello world 
	dbms_output.put_line(LTRIM(str,'.'); -- hello world......
	dbms_output.put_line(TRIM('.' from str2); -- hello world
end;
/

declare
	type namesarray IS VARRAY(5) OF VARCHAR2(10);
	type grades IS VARRAY(5) OF INTEGER;
	names namesarray;
	marks grades;
	total integer;
begin
	names := namesarray('Kafka','zookeper','hugao');
	marks := grades(98,97,78,92);
	total := names.count;
	dbms_output.put_line('Total is ' || total);
	FOR i IN 1 .. total loop
		-- 在Oracle环境中，varrays的起始索引始终为1
		dbms_output.put_line('name is ' || names(i) || ' marks is ' || marks(i));
	end loop;
end;
/

declare
	CURSOR c_customers is
	select name from customers;
	type c_list is varray(6) of customers.name%type;
	name_list c_list := c_list();
	counter integer := 0;
begin
	--　将数据库 customers 里面的name字段值全部存入 name_list 输出
	FOR n in c_customers loop
		counter := counter + 1;
		name_list.extend; --
		name_list(counter) := n.name;
		dbms_output.put_line('Customer('||counter||'): ' || name_list(counter));
	end loop
end;
/



