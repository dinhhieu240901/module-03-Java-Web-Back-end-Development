-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

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