-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

drop procedure if exists add_new_contract_procedure;

DELIMITER //
create procedure add_new_contract_procedure(
    in new_contract_id int,
    in new_start_date datetime,
    in new_end_date datetime,
    in new_deposit double,
    in new_employee_id int,
    in new_customer_id int,
    in new_facility_id int,
    in new_is_delete bit(1)
)
begin
    if new_contract_id not in (select id from contract) and
       datediff(new_end_date, new_start_date) > 0 and
       new_deposit > 0 and
       new_employee_id in (select id from employee) and
       new_customer_id in (select id from customer) and
       new_facility_id in (select id from facility)
    then 
        insert into contract(id, start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete)
        values (new_contract_id, new_start_date, new_end_date, new_deposit, new_employee_id, new_customer_id, new_facility_id, new_is_delete);
    end if;
end //
DELIMITER ;


call add_new_contract_procedure(
    27, 
    '2023-08-15', 
    '2023-09-01', 
    215,
    2, 
    11, 
    3, 
    0 
);
select * from contract;