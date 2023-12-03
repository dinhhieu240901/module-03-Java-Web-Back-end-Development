-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database. Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
use resort_management;

drop table if exists contract_delete_history;
create table contract_delete_history (
    id int auto_increment primary key,
    contract_id int,
    delete_date datetime,
    remaining_contracts int
);

drop trigger if exists tr_delete_contract;

DELIMITER //
create trigger tr_delete_contract 
after delete
on contract
for each row
begin 
    declare count_remaining int;
    select count(id) into count_remaining from contract;
    insert into contract_delete_history(
        contract_id,
        delete_date,
        remaining_contracts
    )
    values
    (
        old.id,
        now(),
        count_remaining
    );
end //
DELIMITER ;


delete from contract where id = 27;
set sql_safe_updates = 0;
select * from contract;
select * from contract_delete_history;

