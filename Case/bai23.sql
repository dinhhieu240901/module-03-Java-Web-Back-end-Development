
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
drop procedure if exists remove_customer_procedure;

DELIMITER //
create procedure remove_customer_procedure(in customer_id INT)
begin
    update customer set is_delete = 1 where id = customer_id;
end //
DELIMITER ;

CALL remove_customer_procedure(1);

select * from customer;