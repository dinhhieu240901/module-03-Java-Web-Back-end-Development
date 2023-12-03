-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Phú Nhuận” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
select * from view_employee;
set sql_safe_updates =0 ;
update view_employee 
set address = 'Phú Nhuận';


UPDATE employee
SET address = 'Bình Dương'
WHERE address = 'Phú Nhuận';


