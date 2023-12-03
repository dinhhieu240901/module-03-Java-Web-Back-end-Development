/*
28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
từ đầu năm 2018 đến hết năm 2023 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những 
hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
*/

DELIMITER //
create procedure del_service_room_contract_sp()
begin	
	delete contract,contract_detail,facility,attach_facility
    from facility
    join facility_type on facility.facility_type_id = facility_type.id
    join contract on facility.id = contract.facility_id
    join contract_detail on contract.id = contract_detail.contract_id
    join attach_facility on contract_detail.attach_facility_id  = attach_facility_id
    where 
		year(contract.start_date) >=2022
        and year(constract.start_date)<=2023
        and facility_type.name ='Room';
end //

DELIMITER ;

call del_service_room_contract_sp();
call del_service_room_contract_sp();