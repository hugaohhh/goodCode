declare
	type salary IS table of number index by varchar2(20);
	salary_list salary;
	name varchar2(20);
begin
	salary_list('AAA') := 62000;
	salary_list('BBB') := 56000;
	salary_list('CCC') := 54656;
	salary_list('DDD') := 960131;
	
	name := salary_list.FIRST; --返回集合中索引n之前的索引编号。
	while name is not null loop
		dbms_output.put_line(name || '的工资是 ' || TO_CHAR(salary_list(name)));
		name := salary_list.NEXT(name); --返回索引n成功的索引号。
	end loop;
end;
/

declare
	CURSOR c_customer is 
		select name from customers;
		
	type c_list is table of customers.name%type index by binary_integer;
	name_list c_list;
	counter integer := 0;
begin
	for n in c_customer loop
		counter := counter +1;
		name_list(counter) := n.name;
		dbms_output.put_line('第'|| counter ||'个顾客的名字是' name_list(counter));
	end loop;
end;
/

declare
	type names_table is table of varchar2(10);
	type grades is table of integer;
	names names_table;
	marks grades;
	total integer;
begin
	names := names_table('AAA','BBB','CCC','DDD');
	marks := grades(98,97,45,95);
	total := names.count;
	dbms_output.put_line('Total ' || total || ' students ');
	for i in 1 .. total loop
		dbms_output.put_line('Student ' || names(i)|| ' Marks '|| marks(i));
	end loop;
end;
/

DECLARE 
   CURSOR c_customers is  
      SELECT  name FROM customers;  
   TYPE c_list IS TABLE of customers.name%type; 
   name_list c_list := c_list(); 
   counter integer :=0; 
BEGIN 
   FOR n IN c_customers LOOP 
      counter := counter +1; 
      name_list.extend; -- 追加一个空(null)元素到集合。
      name_list(counter)  := n.name; 
      dbms_output.put_line('Customer('||counter||'):'||name_list(counter)); 
   END LOOP; 
END; 









