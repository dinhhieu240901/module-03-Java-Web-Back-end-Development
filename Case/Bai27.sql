/* 
27.	Tạo Function thực hiện yêu cầu sau:
a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2000 VNĐ.
b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc
 hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, 
 không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.
*/

-- a. create function count_services

DELIMITER //
	create function count_services_func() returns int
    DETERMINISTIC
	READS SQL DATA
begin 
		declare count_services int; 
        select count(*) into count_services
        from contract
         left join facility on contract.facility_id = facility.id
        join contract_detail on contract.id = contract_detail.contract_id
        join attach_facility on  contract_detail.attach_facility_id = attach_facility.id
       where contract.is_delete = 0
			and (facility.cost + (contract_detail.quantity * attach_facility.cost)) > 1000;
		 return count_services;
end//
DELIMITER ;
-- create func Calculate the contract time
DELIMITER //
	create function calculate_contract_func(customer_id_param int ) returns int 
    DETERMINISTIC
	READS SQL DATA
begin 
	declare max_duration int;
	select datediff(contract.start_date,contract.end_date) into max_duration
    from contract
    where contract.is_delete = 0
    and contract.customer_id  = customer_id_param;
	return max_duration;
end //

DELIMITER ;
drop function count_services_func;
select count_services_func() as 'SoLuongDichVu';

select calculate_contract_func(1); -- sai

