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
    select name
    from customer
    union
    select name
    from customer
) as temp_table;
-- Cach 4
SELECT 
    name
FROM
    customer 
UNION SELECT 
    name
FROM
    customer