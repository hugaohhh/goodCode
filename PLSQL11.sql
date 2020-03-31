create or replace type address AS object
(
	house_no varchar2(10),
	street varchar2(30),
	city varchar2(20),
	pincode varchar2(10)
);

create or replace type customer AS object
(
	code number(5),
	name varchar2(30),
	contact_no varchar2(12),
	addr address,
	member procedure display
);

declare
	residence address;
begin
	residence := address('2-711','人民大道','海口','海南','201901');
	 dbms_output.put_line('House No: '|| residence.house_no); 
   dbms_output.put_line('Street: '|| residence.street); 
   dbms_output.put_line('City: '|| residence.city); 
   dbms_output.put_line('Province: '|| residence.state); 
   dbms_output.put_line('Pincode: '|| residence.pincode);
end;
/

-- 创建类
create or replace type rectangle AS object
(
	length number,
	width number,
	member function enlarge(inc number) return rectangle,
	member procedure display,
	map member function measure return number
);
-- 创建类主体
create or replace type body rectangle AS
	member function enlarge(inc number) return rectangle IS
	begin
		return rectangle(self.length + inc, self.width + inc);
	end enlarge;
	
	member procedure display is
	begin
		dbms_output.put_line('length ' || length);
		dbms_output.put_line('width ' || width);
	end display;
	
	map member function measure return number is
	begin
		return (sqrt(length*length + width*width));
	end measure;
end ;
/

declare
	r1 rectangle;
	r2 rectangle;
	r3 rectangle;
	inc_factor number := 5;
begin
	r1 := rectangle(3,4);
	r2 := rectangle(5,7);
	r3 := r1.enlarge(inc_factor);
	r3.display;
	if (r1 > r2) then
		r1.display;
	else
		r2.display;
	end if;
end;
/

create or replace type rectangle AS object
(
	length number,
	width number,
	member procedure display,
	order member function measure(r rectangle) return number
)
;
create or replace type body rectangle AS
	member procedure display is
	begin
		dbms_output.put_line('length ' || length);
		dbms_output.put_line('width ' || width);
	end display;
	
	order member function measure(r rectangle) return number is
	begin
		if (sqrt(self.length*self.length + self.width*self.width) > 
			sqrt(r.length*r.length + r.width*r.width)) then
			return(1);
		else 
			return(-1);
		end if;
	end measure;
end;
/

declare
	r1 rectangle;
	r2 rectangle;
	r3 rectangle;
	inc_factor number := 5;
begin
	r1 := rectangle(3,4);
	r2 := rectangle(5,7);
	r1.display;
	r2.display;
	if (r1 > r2) then
		r1.display;
	else
		r2.display;
	end if;
end;
/

