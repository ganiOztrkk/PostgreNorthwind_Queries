--61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name
from products p
inner join categories c
on p.category_id = c.category_id
inner join suppliers s
on p.supplier_id = s.supplier_id
where units_on_order = (select max(units_on_order) from products);


--62. Kaç ülkeden müşterim var
select count(distinct(country))
from customers;


--63. Hangi ülkeden kaç müşterimiz var
select country, count(country)
from customers
group by country;

--64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(od.quantityp.unit_price) from orders o
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on od.order_id = o.order_id
inner join products p on od.product_id = p.product_id
where e.employee_id =3 and o.order_date >= '2023-01-01';


--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?

select sum("Total Revenue") as "Total"
from
(
select order_date,(od.unit_price * od.quantity) as "Total Revenue"
from order_details od
inner join orders o 
on od.order_id = o.order_id
where od.product_id = 10 and o.order_date >= (select order_date 
										 from orders 
										 where product_id=10 
										 order by order_date 
										 desc limit 1) - interval '2 months'
)

--66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?

select sum(od.quantity),o.employee_id, e.first_name, e.last_name from orders o
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on o.order_id = od.order_id
group by o.employee_id, e.first_name, e.last_name;

--67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun

select * from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;
--68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri

select company_name, contact_name, address, city, country 
from customers 
where  customer_id = (select customer_id where country = 'Brazil');

--69. Brezilya’da olmayan müşteriler

select * 
from customers 
where customer_id = (select customer_id where country != 'Brazil')
--70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler

select customer_id, contact_name
from customers
where country = 'Spain' or country = 'France' or country = 'Germany';

--71. Faks numarasını bilmediğim müşteriler
select *
from customers
where fax is null;


--72. Londra’da ya da Paris’de bulunan müşterilerim
select contact_name
from customers
where city ='London' or city ='Paris';


--73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
select customer_id, contact_name, contact_title
from customers 
where city= 'México D.F.' and contact_title='Owner';


--74. C ile başlayan ürünlerimin isimleri ve fiyatları
select product_name, unit_price
from products
where lower(product_name) like 'c%';


--75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
select first_name, last_name, birth_date
from employees
where lower(first_name) like 'a%';

--76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
select company_name
from customers
where UPPER(company_name) like '%RESTAURANT%';


--77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
select product_name, unit_price
from products
where unit_price between 50 and 100;



--78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin
--(Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
select order_id, order_date
from orders
where order_date between '1996.07.01' and '1996.12.31'
order by order_date;



--79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select customer_id, contact_name, country
from customers 
where country = 'Spain' or country ='France' or country ='Germany';


--80. Faks numarasını bilmediğim müşteriler
select count(*)
from customers
where fax is null;


--81. Müşterilerimi ülkeye göre sıralıyorum:
select customer_id, contact_name, country
from customers
order by country;


--82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price
from products
order by unit_price desc;


--83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, 
--ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price
from products
order by unit_price desc, units_in_stock asc;


--84. 1 Numaralı kategoride kaç ürün vardır..?
select count(*)
from products
where category_id = 1;


--85. Kaç farklı ülkeye ihracat yapıyorum..?
select count(distinct(country))
from customers;
