declare
	-- 一行のコメント
	message varchar2(20) := 'hello world!';
	num1 INTEGER;
	num2 REAL;
	num3 DOUBLE PRECISION;
	SUBTYPE name IS char(20);
	SUBTYPE message IS varchar2(100);
	userName name;
	error message;
	
	sales number(10,2);
	pi CONSTANT double precision := 3.1415; -- 常量
	name varchar2(25);
	address varchar2(100);
	counte binary_integer := 0;
	str varchar2(20) DEFAULT 'test str'; -- 给与默认值
begin
	/**
	　複数のコメント
	*/
	userName := 'user01';
	error := 'password eroor';
	dbms_output.put_line(userName || error); -- user01 password eroor
	dbms_output.put_line(message);
exception
	
end;
/
