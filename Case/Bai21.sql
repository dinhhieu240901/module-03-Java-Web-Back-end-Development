-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2022”.
use resort_management;
drop view if exists view_employee;
create view view_employee as
    select 
        *
    from
        employee
    where
        address like '%Bình Dương%'
            or id in (select 
                employee_id
            from
                contract
            where
                start_date = '2022-07-10');


                
select * from contract ;
select * from employee;
select * from view_employee;