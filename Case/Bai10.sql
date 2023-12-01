-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select contract.id as 'Mã Hợp Đồng',
		contract.start_date as 'Ngày làm hợp đồng',
        contract.end_date as 'Ngày kết thúc',
        contract.deposit as 'Tiền đặt cọc',
		sum(contract_detail.quantity) as 'Số lượng dịch vụ đi kèm'
from contract 
join contract_detail on contract_detail.contract_id = contract.id
group by
    contract.id, contract.start_date, contract.end_date, contract.deposit;