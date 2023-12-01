-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 20222 nhưng chưa từng được khách hàng đặt phòng trong năm 2023.
select
    facility.id AS 'Mã Dịch Vụ',
    facility.name AS 'Tên Dịch Vụ',
    facility.area AS 'Diện tích',
    facility.max_people AS 'Số người tối đa',
    facility.cost AS 'Chi phí thuê',
    facility_type.name AS 'Tên loại dịch vụ'
from
    facility
join
    facility_type ON facility.facility_type_id = facility_type.id
where
    facility.id in (
        select 
            facility.id
        from
            facility
        join
            contract on facility.id = contract.facility_id
        where
            year(contract.start_date) = 2022
    )
and
    facility.id not in (
        select 
            facility.id
        from
            facility
        join
            contract on facility.id = contract.facility_id
        where
            year(contract.start_date) = 2023
    );