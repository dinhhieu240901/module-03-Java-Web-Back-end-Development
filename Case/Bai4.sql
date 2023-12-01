-- 4	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select customer.name AS 'Tên Khách Hang', customer_type.name AS 'Loại Khách Hàng', COUNT(contract.id) AS 'Số lần đặt phòng'
from customer
join customer_type on customer.customer_type_id = customer_type.id
inner join contract on customer.id = contract.customer_id
where customer_type.name = 'Diamond'
group by customer.id, customer_type.name
order by 'Số lần đặt phòng' asc;

