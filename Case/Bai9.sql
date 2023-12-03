select
    month(contract.start_date) as 'tháng',
    count( customer.id) as 'số lượng khách hàng'
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