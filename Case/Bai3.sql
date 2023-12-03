use resort_management;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Sài Gòn” hoặc “Quảng Nam”. ( Cách 1)

-- Cách 1 
select 
    *
from
    customer
where
    ((address regexp 'Sài Gòn$'
        OR address regexp 'Quảng Nam$')
        and Year(curdate()) - year(date_of_birth) between 18 and 50);
;
-- Cách 2
select *
from customer
where (address like '%Sài Gòn' or address like '%Quảng Nam')
and TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 50;
-- Cách 3
select *
from customer
where datediff(CURDATE(), date_of_birth) BETWEEN 18 * 365 AND 50 * 365
   AND (address like '%Sài Gòn' or address like '%Quảng Nam');
   
select * from customer;