-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2023 (Quý 1 là tháng 1, 2, 3).
select
    facility.id AS 'Mã Dịch Vụ',
    facility.name AS 'Tên Dịch Vụ',
    facility.area AS 'Diện tích',
    facility.cost AS 'Chi phí thuê',
    facility_type.name AS 'Tên loại dịch vụ'
from
    facility
join
    facility_type ON facility.facility_type_id = facility_type.id
where
    facility.id not in (
        select 
            facility.id
        from
            facility
        join
            attach_facility on facility.id = attach_facility.id
        join
            contract_detail on attach_facility.id = contract_detail.attach_facility_id
        join
            contract on contract_detail.contract_id = contract.id
        where
            year(contract.start_date) = 2022 and month(contract.start_date) in (1, 2, 3)
    );
    
    select * from contract;