-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2022 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select
    month(contract.start_date) as 'tháng',
    count(distinct customer.id) as 'số lượng khách hàng'
from
    contract
join
    customer on contract.customer_id = customer.id
where
    year(contract.start_date) = 2022
group by
    month(contract.start_date)
order by
    month(contract.start_date);