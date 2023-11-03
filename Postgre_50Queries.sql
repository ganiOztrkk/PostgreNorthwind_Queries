--1. Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
--2. Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.
--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.
--4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
--6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.
--7. İsmi `a` ile başlayan ürünleri listeleyeniz.
--8. İsmi `i` ile biten ürünleri listeleyeniz.
--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
--10. Fiyatı 30 dan büyük kaç ürün var?
--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
--13. Region alanı NULL olan kaç tedarikçim var?
--14. a.Null olmayanlar?
--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
--28. 1997 yılı şubat ayında kaç siparişim var?
--29. London şehrinden 1998 yılında kaç siparişim var?
--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
--31. Taşıma ücreti 40 üzeri olan siparişlerim
--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),
--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
--36. Geciken siparişlerim?
--37. Geciken siparişlerimin tarihi, müşterisinin adı
--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
--49. Kaç ülkeden müşterim var
--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?


--1. Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
select product_name,quantity_per_unit 
from products;

--2. Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.
select product_id, product_name
from products
where discontinued = 1;

--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.
select product_id, product_name
from products
where discontinued = 0;

--4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
select product_id, product_name, unit_price 
from products 
where unit_price<20;

--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.
select product_id, product_name, unit_price 
from products 
where unit_price>15 and unit_price<25;

--6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.
select product_name,units_in_stock,units_on_order 
from products;

--7. İsmi `a` ile başlayan ürünleri listeleyeniz.
select * 
from products 
where lower(product_name) like 'a%';

--8. İsmi `i` ile biten ürünleri listeleyeniz.
select * 
from products 
where lower(product_name) like '%i';

--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
select product_name, unit_price, unit_price1.18 as unitPriceKdv 
from products ;

--10. Fiyatı 30 dan büyük kaç ürün var?
select count() 
from products where unit_price>30;

--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
select lower(product_name), unit_price 
from products order by unit_price;

--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
select first_name  last_name 
from employees;

--13. Region alanı NULL olan kaç tedarikçim var?
select count() 
from employees 
where region is null;

--14. a.Null olmayanlar? 
select count() 
from employees 
where region is not null;

--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select 'TR' || upper(product_name)
from products;

--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
select 'TR' || upper(product_name)
from products
where unit_price<20;

--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
SELECT "product_name", "unit_price"
FROM products
ORDER BY "unit_price" DESC
LIMIT 10;

--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
SELECT "product_name", "unit_price"
FROM products
ORDER BY "unit_price" DESC
LIMIT 10;

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
SELECT "product_name", "unit_price"
FROM products
WHERE "unit_price" > (SELECT AVG("unit_price") FROM products);

--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
select sum(units_in_stock*unit_price) as total_revenue
from products;

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
select product_name, units_in_stock, discontinued
from products
where units_in_stock>0 and discontinued=1;

--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
select product_name, category_name
from products p
inner join categories c
on p.category_id = c.category_id;

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
select category_name, avg(unit_price)
from products p
inner join categories c
on p.category_id = c.category_id
group by category_name;

--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
select product_name, unit_price, category_name
from products p
inner join categories c
on p.category_id = c.category_id
where unit_price = (select max(unit_price)
	   				from products);

--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name
from products p
inner join categories c
on p.category_id = c.category_id
inner join suppliers s
on p.supplier_id = s.supplier_id
where units_on_order = (select max(units_on_order)
	   					from products);
						
--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.

select product_id, product_name, company_name, phone
from products p
inner join suppliers s
on p.supplier_id = s.supplier_id
where units_in_stock <1;


--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı

select order_id, ship_address, first_name || last_name as Employee
from orders o 
inner join employees e
on o.employee_id = e.employee_id
where order_date between '1998-03-01' and '1998-03-31';

--28. 1997 yılı şubat ayında kaç siparişim var?
SELECT count(order_id) 
FROM orders
where EXTRACT(YEAR FROM order_date) = 1997 and EXTRACT(MONTH FROM order_date) = 2;

--29. London şehrinden 1998 yılında kaç siparişim var?

select count(*) as "1998 London"
from orders o
where EXTRACT(YEAR FROM o.order_date) = 1998 and ship_city = 'London';


--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası

select contact_name, phone
from orders o
inner join customers c
on o.customer_id = c.customer_id
where EXTRACT(YEAR FROM o.order_date) = 1997;

--31. Taşıma ücreti 40 üzeri olan siparişlerim

select order_id
from orders
where freight > 40;

--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select ship_city, contact_name
from orders o
inner join customers c
on o.customer_id = c.customer_id
where freight > 40;

--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),

select order_date, ship_city, upper(first_name || last_name) as "Name"
from orders o
inner join employees e
on o.employee_id = e.employee_id
where extract(year from order_date) = 1997;


--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select contact_name, regexp_replace(phone, '[^0-9]', '', 'g') AS formatted_phone
from orders o
inner join customers c
on o.customer_id = c.customer_id
where extract(year from order_date) = 1997;

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
select order_Date, contact_name, first_name as "employee name", last_name as "employee lastname"
from orders o 
inner join customers c
on o.customer_id = c.customer_id
inner join employees e
on o.employee_id = e.employee_id;

--36. Geciken siparişlerim?
select order_id, required_date, shipped_date 
from orders
where shipped_date > required_Date;

--37. Geciken siparişlerimin tarihi, müşterisinin adı

select order_id, required_date, shipped_date, contact_name
from orders o
inner join customers c
on o.customer_id = c.customer_id
where shipped_date > required_Date;

--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select order_id, product_name, category_name, quantity
from order_details o
inner join products p
on o.product_id = p.product_id
inner join categories c
on p.category_id = c.category_id
where order_id = 10248;

--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select order_id, product_name, company_name
from order_details o
inner join products p 
on o.product_id = p.product_id
inner join suppliers s
on p.supplier_id = s.supplier_id
where order_id = 10248;

--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select product_name, quantity
from order_details od
inner join products p
on od.product_id = p.product_id
inner join orders o
on od.order_id=o.order_id
inner join employees e
on o.employee_id = e.employee_id
where e.employee_id = 3 and extract(year from o.order_date) = 1997;

--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select e.employee_id, e.first_name, e.last_name 
from order_details od
inner join orders o
on od.order_id=o.order_id
inner join employees e
on o.employee_id = e.employee_id
where extract(year from o.order_date) = 1997
and quantity = (select max(quantity)
from order_details);
	
--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
with total_sales as (select e.employee_id, e.first_name, e.last_name, sum(od.quantity) as total_sales_quantity
from order_details od
inner join orders o
on od.order_id=o.order_id
inner join employees e
on o.employee_id = e.employee_id
where extract(year from o.order_date) = 1997
group by e.employee_id, e.first_name, e.last_name) 
		
select employee_id, first_name, last_name
from total_sales
where total_sales_quantity = (select max(total_sales_quantity) from total_sales);
	
--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select p.product_name, p.unit_price, c.category_name
from products p
inner join categories c
on p.category_id = c.category_id
where p.unit_price = (select max(unit_price) from products);
	
--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre???


--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select order_id, avg(unit_price*quantity)
from order_details
group by order_id
order by order_id desc
limit 5;


--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select product_name, category_name, quantity
from order_details od
inner join products p
on od.product_id = p.product_id
inner join categories c
on p.category_id = c.category_id
inner join orders o
on od.order_id = o.order_id
where extract(month from o.order_date) = 1;


--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * 
from order_details
where quantity > (select avg(quantity) from order_details);


--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name
from products p
inner join categories c
on p.category_id = c.category_id
inner join suppliers s
on p.supplier_id = s.supplier_id
where units_in_stock = (select max(units_in_stock) from products);


--49. Kaç ülkeden müşterim var
select count(distinct(country))
from customers;


--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı???