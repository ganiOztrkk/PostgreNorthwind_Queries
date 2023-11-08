--87. En Pahalı 5 ürün
select product_id, product_name, unit_price
from products
where unit_price = 
(
	select max(unit_price)
	from products
)
limit 5;

--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
select customer_id, count(*) as "number of orders"
from orders
where upper(customer_id) = 'ALFKI'
group by customer_id;

--89. Ürünlerimin toplam maliyeti
select sum(unit_price * units_in_stock) as "total cost"
from products;

--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
select sum(unit_price * quantity) as "total sale"
from order_details;

--91. Ortalama Ürün Fiyatım
select avg(unit_price) as "average product price"
from products;

--92. En Pahalı Ürünün Adı
select product_id, product_name, unit_price
from products
where unit_price = 
(
	select max(unit_price)
	from products
);

--93. En az kazandıran sipariş

select order_id
from order_details
where (unit_price * quantity) = 
(
	select min(unit_price * quantity)
	from order_details
);

--94. Müşterilerimin içinde en uzun isimli müşteri
select customer_id, contact_name
from customers
where length(contact_name) =
(
	select max(length(contact_name))
	from customers
);


--95. Çalışanlarımın Ad, Soyad ve Yaşları
select employee_id, first_name, last_name, ((extract(year from NOW())) - (extract(year from birth_date)))
from employees;

--96. Hangi üründen toplam kaç adet alınmış..?
select product_name, quantity
from order_details od
inner join products p 
on p.product_id = od.product_id;

--97. Hangi siparişte toplam ne kadar kazanmışım..?
select order_id, sum(unit_price * quantity) as "total profit"
from order_details
group by order_id
order by "total profit" desc;


--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
select category_name, count(*) from products p
inner join categories c
on c.category_id = p.category_id
group by category_name;


--99. 1000 Adetten fazla satılan ürünler?
select product_name, sum(quantity) as "sales"
from order_details od
inner join products p
on od.product_id = p.product_id
group by product_name
having sum(quantity)  > 1000
order by product_name;

--100. Hangi Müşterilerim hiç sipariş vermemiş..?
select customer_id, contact_name
from customers
where customer_id != all(select customer_id
					 from orders);


--101. Hangi tedarikçi hangi ürünü sağlıyor ?
select company_name, product_name 
from suppliers s
inner join products p
on p.supplier_id = s.supplier_id
order by company_name;

--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
select order_id, company_name, shipped_date 
from shippers s
inner join orders o
on o.ship_via = s.shipper_id;


--103. Hangi siparişi hangi müşteri verir..?
select company_name, order_id 
from customers c
inner join orders o
on o.customer_id = c.customer_id;


--104. Hangi çalışan, toplam kaç sipariş almış..?
select first_name, last_name, count(*) 
from employees e
inner join orders o
on e.employee_id = o.employee_id
group by e.employee_id;


--105. En fazla siparişi kim almış..?
select first_name, last_name, count(*) 
from employees e
inner join orders o
on e.employee_id = o.employee_id
group by e.employee_id
order by count desc limit 1;


--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
select first_name, last_name, company_name, order_id 
from customers c
inner join orders o
on o.customer_id = c.customer_id
inner join employees e
on o.employee_id = e.employee_id;


--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
select product_name, category_name, company_name 
from products p
inner join suppliers s
on s.supplier_id = p.supplier_id
inner join categories c
on p.category_id = c.category_id;

select * from orders
--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, 
--ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
select  o.order_id as "Order", 
		cu.contact_name as "Customer", 
		em.first_name as "Employee", 
		o.shipped_date as "Date", 
		sh.company_name as "Shipper", 
		pr.product_name as "Product", 
		od.quantity as "Quantity", 
		od.unit_price as "Price", 
	    ca.category_name as "Category", 
		su.company_name as "Supplier"
from orders o
inner join customers cu
on o.customer_id = cu.customer_id
inner join employees em
on o.employee_id = em.employee_id
inner join shippers sh
on o.ship_via = sh.shipper_id
inner join order_details od
on o.order_id = od.order_id
inner join products pr
on od.product_id = pr.product_id
inner join categories ca
on pr.category_id = ca.category_id
inner join suppliers su
on pr.supplier_id = su.supplier_id;



--109. Altında ürün bulunmayan kategoriler
select category_name 
from categories
where not exists (
	select products.category_id 
	from products);


--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
select * 
from customers
where contact_title like '%Manager%';


--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
select *
from customers
where customer_id like 'FR%___';

--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
select * 
from customers
where phone like '(171)%';

--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
select * 
from products
where quantity_per_unit like '%boxes%';

--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
select contact_name, phone 
from customers
where country in('France', 'Germany') and contact_title like '%Manager%';

--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
select * 
from products
order by unit_price desc 
limit 10;

--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
select * 
from customers
order by country, city ;

--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
select first_name, last_name, (date_part('year',current_date)-date_part('year',birth_date)) as Age 
from employees;

--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
select * 
from orders
where (shipped_date - order_date) = 35;

--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
select category_name 
from categories
where category_id = (select products.category_id 
					from products
					order by unit_price desc 
					limit 1);

--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
select * 
from products
where category_id = any(select category_id 
						from categories
					    where category_name like '%on%');

--121. Konbu adlı üründen kaç adet satılmıştır.
select sum(quantity) 
from order_details
where product_id = any(select product_id 
					   from products
					   where product_name = 'Konbu');

--122. Japonyadan kaç farklı ürün tedarik edilmektedir.
select count(*) 
from products
where supplier_id = any(select supplier_id 
						from suppliers
					    where country = 'Japan');

--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
select min(freight) as "Min", max(freight) as "Max", avg(freight) as "Avg" 
from orders
where date_part('year', order_date) = 1997;

--124. Faks numarası olan tüm müşterileri listeleyiniz.
select * 
from customers
where fax is not null;

--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz.
select * 
from orders
where shipped_date between '1996-07-16' and '1996-07-30';