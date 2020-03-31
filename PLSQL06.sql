-- 隐式游标 %found %rowcount 等
declare
	total_rows number(2);
begin
	update customers
	set salary = salary + 500;
	if sql%notfound then
		dbms_output.put_line('not found customers');
	elsif sql%found then
		total_rows := sql%rowcount;
		dbms_output.put_line('total customers is updated' || total_rows);
	end if;
end;
/

declare
	c_id customers.id%type;
	c_name customers.name%type;
	c_addr customers.address%type;
	-- 声明游标
	CURSOR c_customers is 
		select id,name,address from customers;
begin
	OPEN c_customers; -- 打开游标
	loop
	fetch c_customers into c_id,c_name,c_addr; -- 使用游标
		exit when c_customers%notfound;
		dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
	end loop;
	close c_customers; -- 关闭游标
end;
/

declare
-- 使用表记录示例代码
	customer_rec customers%rowtype;
begin
	select * into customer_rec
	from customers
	where id = 5;
	dbms_output.put_line('客户ID: ' || customer_rec.id); 
	dbms_output.put_line('客户姓名: ' || customer_rec.name); 
	dbms_output.put_line('客户地址: ' || customer_rec.address); 
	dbms_output.put_line('客户薪资: ' || customer_rec.salary);

end;
/

declare
	CURSOR customer_cur is 
		select id,name,address
		from customers;
	customer_rec customer_cur%rowtype;
begin
	OPEN customer_cur;
	loop
		fetch customer_cur into customer_rec;
		exit when customer_cur%notfound;
		dbms_output.put_line(customer_rec.id || ' ' || customer_rec.name);
	end loop;
end;
/

declare
-- 自定义记录
	type books is record
		(title varchar(50),
		author varchar(50),
		subject varchar(100),
		book_id number);
	book1 books;
	book2 books;
begin
	-- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'TanHao';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 1920122;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'LiDawei'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 2032942; 

-- Print book 1 record 
   dbms_output.put_line('Book 1 title : '|| book1.title); 
   dbms_output.put_line('Book 1 author : '|| book1.author); 
   dbms_output.put_line('Book 1 subject : '|| book1.subject); 
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id); 

   -- Print book 2 record 
   dbms_output.put_line('Book 2 title : '|| book2.title); 
   dbms_output.put_line('Book 2 author : '|| book2.author); 
   dbms_output.put_line('Book 2 subject : '|| book2.subject); 
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id); 
end;
/

declare
	type books is record
		(title varchar(50),
		author varchar(50),
		subject varchar(100),
		book_id number);
	book1 books;
	book2 books;
procedure printbook(book books) IS
begin
	dbms_output.put_line('Book  title : '|| book.title); 
   dbms_output.put_line('Book  author : '|| book.author); 
   dbms_output.put_line('Book  subject : '|| book.subject); 
   dbms_output.put_line('Book  book_id : ' || book.book_id); 
end;

begin
	-- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'TanHao';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 1920122;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'LiDawei'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 2032942; 
   
   -- use procedure to print book info
   printbook(book1);
   printbook(book2);
end;
/
	