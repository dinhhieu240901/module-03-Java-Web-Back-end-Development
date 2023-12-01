-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select
    customer.id AS 'Mã Khách Hàng',
    customer.name AS 'Tên Khách Hàng',
    customer_type.name AS 'Loại Khách Hàng',
    contract.id AS 'Mã Hợp Đồng',
    service.name AS 'Tên Dịch Vụ',
    contract.start_date AS 'Ngày Làm Hợp Đồng',
    contract.end_date AS 'Ngày Kết Thúc Hợp Đồng',
   (
    contract.deposit + contract_service.quantity * service.price  + contract_detail.quantity * attach_facility.cost
) AS 'Tổng Tiền'

from customer
inner join contract ON customer.id = contract.customer_id
inner join customer_type ON customer.customer_type_id = customer_type.id
inner join contract_service ON contract.id = contract_service.contract_id
inner join service ON contract_service.service_id = service.id
inner join contract_detail ON contract.id = contract_detail.contract_id
inner join attach_facility ON contract_detail.attach_facility_id = attach_facility.id
group by customer.id, customer.name, customer_type.name, contract.id, service.name, contract.start_date, contract.end_date, contract.deposit, contract_service.quantity, service.price, contract_detail.quantity, attach_facility.cost;