create or replace PROCEDURE pro1
AS
begin 
	dbms_output.put_line('Hello world!');
end;
/

-- 以下是使用 procedure 的方法
exec pro1;
execute pro1;

DROP procedure pro1; -- 删除 procedure

declare

procedure findMin(x in number, y in number,z out number) is
begin
	if x < y then
		z := x;
	else
		z := y;
	end if;
end;

begin
	a := 12;
	b := 23;
	findMin(a,b,c);
	dbms_output.put_line('两个数 '|| x ||' , ' || y || '的最小值是 ： ' || c);
end;
/

declare
	a number;
procedure squareNum(x in out number) is 
begin
	x := x * x;
end;

begin
	a := 11;
	squareNum(a);
	dbms_output.put_line('a的二次方是 ' || a);
end;
/

