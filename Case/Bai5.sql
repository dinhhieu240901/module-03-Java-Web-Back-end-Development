select
    customer.id as 'MaKhachHang',
    customer.name as 'HoTen',
    customer_type.name as 'TenLoaiKhach',
    contract.id as 'MaHopDong',
    facility.name as 'TenDichVu',
    contract.start_date as 'NgayLamHopDong',
    contract.end_date as 'NgayKetThuc',
    sum(
        ifnull(facility.cost, 0) + 
        ifnull((contract_detail.quantity * attach_facility.cost), 0) +
        ifnull((contract_service.quantity * service.price), 0)
    ) as tong_tien
from
    customer
left join
    customer_type on customer.customer_type_id = customer_type.id
left join
    contract on customer.id = contract.customer_id
left join
    contract_detail on contract.id = contract_detail.contract_id
left join
    attach_facility on contract_detail.attach_facility_id = attach_facility.id
left join
    facility on attach_facility.id = facility.id
left join
    contract_service on contract.id = contract_service.contract_id
left join
    service on contract_service.service_id = service.id
group by
    customer.id, contract.id, facility.id
order by
    customer.id, contract.id, facility.id;

select * from contract;