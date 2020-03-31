-- 创建主对象
create or replace type rectangle force as object
(
	length number,
	width number
	member function enlarge(inc number) return rectangle,
	NOT FINAL member procedure display
) not final;
-- 创建主对象体
create or replace type body rectangle as
	member function enlarge(inc number) return rectangle IS
	begin
		return rectangle(self.length + inc, self.width + inc);
	end enlarge;
	member procedure display is
	begin
		dbms_output.put_line('length ' || length);
		dbms_output.put_line('width ' || width);
	end display;
end;
/
-- 创建子对象
create or replace type tabletop under rectangle
(
	material varchar2(20),
	overriding member procedure display
);
-- 创建子对象体
create or replace type body tabletop as
	overriding member procedure display is
	begin
		dbms_output.put_line('length ' || length);
		dbms_output.put_line('width ' || width);
		dbms_output.put_line('Material ' || material);
	end display;
end;
/

declare 
	t1 tabletop;
	t2 tabletop;
begin
	t1 := tabletop(20,10,'wood');
	t2 := tabletop(50,30,'steel');
	t1.display;
	t2.display;
end;
/

-- 创建抽象对象
create or replace type rectangle as object
(
	length number,
	width number,
	NOT instantiable not final member procedure display
) not instantiable not final;







