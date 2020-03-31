-- create function
create or replace function totalCustomers
return number IS 
	total number(2) := 0;
begin
	select count(*) into total
	from customers;
	
	return total;
end;
/

-- use function
declare
	c number(2);
begin
	c := totalCustomers();
	dbms_output.put_line('this is customers' || c);
end;
/


create or replace function findMax(x in number, y in number)
return number
IS
	z number;
begin
	if x > y then
		z := x;
	else
		z := y;
	end if;
	return z;
end;
/

declare
	a number;
	b number;
	c number;
begin
	a := 23;
	b := 45;
	c := findMax(a,b);
	dbms_output.put_line('max number is ' || c);
end;
/

declare
	num number;
	factorial number;
function fact(x number)
return number 
IS	
	f number;
begin
	if x = 0 then 
		f := 1;
	else 
		f := x * fact(x -1);
	end if;
	return f;
end;

begin
	num := 10;
	factorial := fact(num);
	dbms_output.put_line(' 数字 '|| num || ' 的阶乘积是： ' || factorial); 
end;
/



