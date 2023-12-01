-- Cach 1
select distinct name
from customer;
-- Cach 2 

select name
from customer
group by name;
-- Cach 3 
select name
from (
    select distinct name
    from customer
    union
    select distinct name
    from customer
) as temp_table;