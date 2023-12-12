create database resort_management;
use resort_management;
create table `position`(
	id int primary key auto_increment,
    name nvarchar(55) not null,
    is_delete bit(1) default 0
);
create table education_degree(
	id int primary key auto_increment,
    name varchar(45) not null,
    is_delete bit(1) default 0
);
create table division(
	id int primary key auto_increment,
    name varchar(45) not null,
    is_delete bit(1) default 0
);

create table role(
	role_id int primary key auto_increment,
    role_name varchar(255) not null,
    is_delete bit(1) default 0
);

create table user(
    user_name varchar(255) primary key,
    password varchar(255) not null,
    is_delete bit(1) default 0
);

create table user_role(
	role_id INT,
	user_name varchar(255),
    is_delete bit(1) default 0,
    foreign key (role_id) references role(role_id),
    foreign key (user_name) references user(user_name)
);

create table employee(
	id bigint auto_increment primary key,
	name nvarchar(50) not null,
	date_of_birth datetime not null,
	id_card varchar(12) not null,
	salary double not null,
	phone_number varchar(13) not null,
	email varchar(55) not null,
	address nvarchar(55) not null,
	position_id int,
	education_degree_id int,
	division_id int,
	username varchar(55),
	is_delete bit(1) default 0,
	foreign key(position_id) references `position`(id),
	foreign key(username) references user(user_name),
	foreign key(education_degree_id) references education_degree(id)
);

create table customer_type(
	id int auto_increment primary key,
    name varchar(50) not null,
    is_delete bit(1) default 0
);

create table customer (
	id int auto_increment primary key,
    customer_type_id int,
    name varchar(50) not null,
    gender bit(1) not null,
    date_of_birth varchar(50) not null,
    id_card varchar(12) not null,
    phone_number varchar(12) not null,
    email varchar(45) not null,
    address varchar(50) not null,
    is_delete bit(1) default 0,
    foreign key (customer_type_id) references customer_type(id)
);

create table facility_type(
	id int auto_increment primary key,
    name varchar(45) not null,
    is_delete bit(1) default 0
);

create table rent_type(
	id int auto_increment primary key,
    name varchar(45) not null,
    is_delete bit(1) default 0
);

create table facility (
	id int auto_increment primary key,
    name varchar(50) not null,
    area int not null,
    cost double not null,
    max_people int not null,
    rent_type_id int,
    facility_type_id int,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    facility_free text,
    is_delete bit(1) default 0,
    foreign key (facility_type_id) references facility_type(id),
    foreign key (rent_type_id) references rent_type(id)
);

create table contract(
	id int auto_increment primary key,
    start_date datetime not null,
    end_date datetime not null,
    deposit double not null,
    employee_id bigint,
    customer_id int,
    facility_id int,
    is_delete bit(1) default 0,
    foreign key (employee_id) references employee(id),
    foreign key (customer_id) references customer(id),
    foreign key (facility_id) references facility(id)
);

create table attach_facility(
	id int auto_increment primary key,
	name varchar(45) not null,
	cost double not null,
	unit varchar(10) not null,
	status varchar(45) not null,
	is_delete bit(1) default 0
);

create table contract_detail(
	id int auto_increment primary key,
    contract_id int,
    attach_facility_id int,
    quantity int not null,
    is_delete bit(1) default 0,
    foreign key (contract_id) references contract(id),
    foreign key (attach_facility_id) references attach_facility(id)
);

create table service_type(
	id int primary key auto_increment,
    name varchar(45) not null,
    is_delete bit(1) default 0
);

create table service(
	id int primary key auto_increment,
    name varchar(50) not null,
    unit varchar(10) not null,
    price double not null,
    service_type_id int,
    is_delete bit(1) default 0,
    foreign key (service_type_id) references service_type(id)
);

create table contract_service(
	contract_id int,
    service_id int,
    quantity int not null,
    is_delete bit(1) default 0,
    foreign key (contract_id) references contract(id),
    foreign key (service_id) references service(id)
);
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * 
from employee
where (name like 'H%' or name like 'T%' or name like 'K%')
and length(name)<=15;   
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select * from(
select distinct
    attach_facility.id as 'MaDichVuDiKem',
    attach_facility.name as 'TenDichVuDiKem',
    attach_facility.cost as 'ChiPhi',
    attach_facility.unit as 'DonVi',
    attach_facility.status as 'TrangThai',
    customer.name as 'HoTenKhachHang',
    customer_type.name as 'LoaiKhachHang',
    customer.address as 'DiaChi'
from
    attach_facility
join
    contract_detail on attach_facility.id = contract_detail.attach_facility_id
join
    contract on contract_detail.contract_id = contract.id
join
    customer on contract.customer_id = customer.id
join
    customer_type on customer.customer_type_id = customer_type.id
WHERE
    (customer.address LIKE '%Vinh'
        OR customer.address LIKE '%Quảng Ngãi')
        AND customer_type.name = 'Diamond') as results
 order by results.MaDichVuDiKem asc;
select * from customer;
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2022 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2023.
select distinct
    contract.id as 'MaHopDong',
    employee.name as 'HoTenNhanVien',
    customer.name as 'HoTenKhachHnag',
    customer.phone_number as 'SoDienThoaiKhachHang',
    service.name as 'TenDichVu',
    sum(contract_service.quantity) as 'SoLuongDichVuDiKem',
    contract.deposit as 'tiendatcoc'
from
    contract
left join
    employee on contract.employee_id = employee.id
left join
    customer on contract.customer_id = customer.id
left join
    contract_service on contract.id = contract_service.contract_id
left join
    service on contract_service.service_id = service.id
where
    year(contract.start_date) = 2022
    and (month(contract.start_date) in (10, 11, 12) or month(contract.end_date) in (10, 11, 12))
    and contract.id not in (
        select contract.id
        from contract
        where  year(contract.start_date) = 2023
        and (month(contract.start_date) between 1 and 6)
    )
group by
    contract.id, employee.name, customer.name, customer.phone_number, service.name, contract.deposit;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select
    attach_facility.id as 'MaDichVuDiKem',
    attach_facility.name as 'TenDichVuDiKem',
    count(contract.id) as 'SoLanSuDung'
from
    attach_facility
join
    contract_detail on attach_facility.id = contract_detail.attach_facility_id
join
    contract on contract_detail.contract_id = contract.id
group by
    attach_facility.id, attach_facility.name
having
    count(contract.id) >= all (
        select
            count(contract.id)
        from
            attach_facility
        join
            contract_detail on attach_facility.id = contract_detail.attach_facility_id
        join
            contract on contract_detail.contract_id = contract.id
        group by
            attach_facility.id, attach_facility.name
    );
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select distinct
    contract.id as 'MaHopDong',
    facility_type.name as 'TenLoaiDichVu',
    attach_facility.name as 'TenDichVuDiKem',
    count(attach_facility.id) as 'SoLanSuDung'
from
    contract
join
    contract_detail on contract_detail.contract_id = contract.id 
join
    attach_facility on attach_facility.id = contract_detail.attach_facility_id
join facility on facility.id = contract.facility_id
join facility_type on facility_type.id = facility.facility_type_id
where contract_detail.attach_facility_id in (
select attach_facility_id
from contract_detail
group by
    attach_facility_id
having
    count(attach_facility.id) = 1)
group by contract.id,facility_type.name,attach_facility.name
order by contract.id;






-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2022 đến 2023.
select
    employee.id AS 'MaNhanVien',
    employee.name AS 'HoTen',
    education_degree.name AS 'TenTrinhDo',
    position.name AS 'TenBoPhan',
    employee.phone_number AS 'SoDienThoai',
    employee.address AS 'DiaChi',
    count(contract.id) AS 'SoLuongHopDong' 
from
    employee
join
    contract ON employee.id = contract.employee_id
join
    education_degree ON employee.education_degree_id = education_degree.id
join
    position ON employee.position_id = position.id
where
	position.name !='Giám đốc'
    and year(contract.start_date) between 2022 and 2023
group by 
    MaNhanVien
having
    COUNT(contract.id) <= 3
order by MaNhanVien;
-- 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2022 đến năm 2023.
-- Hiển thị thông tin nhân viên và số hợp đồng đã ký
select
    employee.id as 'MaNhanVien',
    name as 'HoTenNhanVien',
    email as 'Email',
    phone_number as 'SoDienThoai',
    count(contract.id) as 'SoHopDong'
from
    employee
left join
    contract on contract.employee_id = employee.id and year(start_date) between 2022 and 2023
group by
    employee.id
having
    count(contract.id) = 0;
-- Chuyển trạng thái is_delete của nhân viên (Soft delete)
set sql_safe_updates = 0 ;

update employee
set is_delete = 1
where id in (
    select id from (
        select employee.id
        from employee
        left join contract on contract.employee_id = employee.id and year(start_date) between 2022 and 2023
        group by employee.id
        having count(contract.id) = 0
    ) as tmp
);
select * from employee;
-- xóa nhân viên chưa từng lập hợp đồng (Hard Delete ( không khuyến khích) )
delete from employee
where id in (
    select id from (
        select employee.id
        from employee
        left join contract on contract.employee_id = employee.id and year(start_date) between 2022 and 2023
        group by employee.id
        having count(contract.id) = 0
    ) as tmp
);

select * from employee;
-- 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2022
-- Hiển thị thông tin khách hàng Platinum có số tiền đặt phòng > 1000 VNĐ
select 
    contract.customer_id as 'makhachhang',
    customer.name as 'tenkhachhang',
    customer_type.name,
    sum(facility.cost + (contract_detail.quantity * attach_facility.cost)) as 'tongtiendatphong'
from
    contract
join
    customer on contract.customer_id = customer.id
join 
    customer_type on customer_type.id = customer.customer_type_id
join
    contract_detail on contract.id = contract_detail.contract_id
join
    attach_facility on contract_detail.attach_facility_id = attach_facility.id
left join
    facility on attach_facility.id = facility.id
where
    contract.is_delete = 0
    and year(contract.start_date) = 2022
    and customer_type.name = 'Platinum'
group by contract.customer_id
having
    tongtiendatphong > 1000
order by
    tongtiendatphong desc;

-- Cập nhật khách hàng lên kim cương
update customer
set customer_type_id = (select id from customer_type where name = 'Diamond')
where id in (
    select contract.customer_id
    from contract
    join contract_detail on contract.id = contract_detail.contract_id
    join attach_facility on contract_detail.attach_facility_id = attach_facility.id
    left join facility on attach_facility.id = facility.id
    where year(contract.start_date) = 2022
    and contract.is_delete = 0
    group by contract.customer_id
    having ifnull(sum(facility.cost + (contract_detail.quantity * attach_facility.cost)), 0) > 1000
) and customer_type_id = (select id from customer_type where name = 'Platinum');


    select * from customer;

--  18.	Xóa những khách hàng có hợp đồng trước năm 2022 (chú ý ràng buộc giữa các bảng).
select 
    customer.id, customer.name
from
    customer
        join
    contract on contract.customer_id = customer.id
where
    contract.customer_id in (select 
            contract.customer_id
        from
            contract
        where
            year(contract.start_date) < 2022)
group by customer.id;
-- chuyển trạng thái is_delete trong bảng customer thành 1 (soft delete)
update customer
set is_delete = 1
where id in (
    select 
        customer.id
    from
        customer
            join
        contract on contract.customer_id = customer.id
    where
        contract.customer_id in (select 
                contract.customer_id
            from
                contract
            where
                year(contract.start_date) < 2022)
);
select * from customer;
insert into contract(start_date,end_date,deposit,employee_id,customer_id,facility_id,is_delete) values 
('2021-12-05', '2021-12-30', 500, 8, 13, 7, 0);
select * from contract;

    -- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.    
-- Hiển thị các dịch vụ được sử dụng trên 5 lần trong năm 2022
select 
	attach_facility.id as 'MaDichVuDiKem' , contract_detail.quantity as 'SoLuong',attach_facility.cost as 'GiaDichVuDiKem'
from attach_facility
join contract_detail on attach_facility.id = contract_detail.attach_facility_id
join contract on contract_detail.contract_id = contract.id
where contract_detail.quantity > 5
and year(contract.start_date)= 2022 
order by  contract_detail.quantity asc;       

-- update giá dịch vụ đi kèm lên gấp đôi
set sql_safe_updates = 0;

update attach_facility
set cost = cost * 2
where id in (
    select *
    from (
        select attach_facility.id
        from attach_facility
        join contract_detail on attach_facility.id = contract_detail.attach_facility_id
        join contract on contract.id = contract_detail.contract_id
        where contract_detail.quantity > 5
            and year(contract.start_date) = 2022
    ) as subquery
);

select * from contract;
select * from contract_detail;
select * from attach_facility;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
-- Hiển thị thông tin của tất cả nhân viên và khách hàng trong một bảng
select
    'NhanVien' as 'LoaiNguoi',
    id as 'Ma',
    name as 'HoTen',
    email as 'Email',
    phone_number as 'SoDienThoai',
    date_of_birth as 'NgaySinh',
    address as 'DiaChi'
from
    employee

union
select
    'KhachHang' as 'LoaiNguoi',
    id as 'Ma',
    name as 'HoTen',
    email as 'Email',
    phone_number as 'SoDienThoai',
    date_of_birth as 'NgaySinh',
    address as 'DiaChi'
from
    customer;
    