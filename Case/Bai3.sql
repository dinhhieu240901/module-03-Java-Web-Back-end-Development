-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Sài Gòn” hoặc “Quảng Nam”. ( Cách 1)
select *
from customer
where datediff(CURDATE(), date_of_birth) BETWEEN 18 * 365 AND 50 * 365
   AND (address = 'Sài Gòn' OR address = 'Quảng Nam');
   
-- 3. Cách 2 
select * 
from customer 
where year(curdate()) - year(date_of_birth) between 18 and 50
and (address like 'Sài Gòn' or address like 'Quảng Nam');
