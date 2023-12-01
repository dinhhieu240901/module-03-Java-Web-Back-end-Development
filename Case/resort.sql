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

alter table employee add constraint fk_employee_team foreign key (division_id) references division(id);
-- Thêm thông tin cho bảng position
INSERT INTO `position` (name, is_delete) VALUES
('Lễ tân', 0),
('Phục vụ', 0),
('Chuyên viên', 0),
('Giám sát', 0),
('Quản lý', 0),
('Giám đốc', 0);

select * from `position`;

-- Thêm thông tin cho bảng education_degree
INSERT INTO education_degree (name, is_delete) VALUES
('Trung cấp', 0),
('Cao đẳng', 0),
('Đại học', 0),
('Sau đại học',0);

-- Thêm thông tin cho bảng division
INSERT INTO division (name, is_delete) VALUES
('Sale – Marketing', 0),
('Hành Chính', 0),
('Phục vụ', 0),
('Quản lý', 0);

-- Thêm thông tin cho bảng role
INSERT INTO role (role_name, is_delete) VALUES
('Admin', 0),
('Nhân viên', 0);

-- Thêm thông tin cho bảng user
INSERT INTO user (user_name, password, is_delete) VALUES
('DinhHieu', 'hieu@123', 0),
('MaiThy', 'thy@123', 0),
('DucMinh','minh@123', 0),
('KienTrung', 'kien@123', 0),
('NamHoang', 'nam@123', 0);

-- Thêm thông tin cho bảng user_role
INSERT INTO user_role (role_id, user_name, is_delete) VALUES
(1, 'DinhHieu', 0),
(2, 'MaiThy', 0),
(2, 'DucMinh', 0),
(2, 'KienTrung', 0),
(2, 'NamHoang', 0),
(2,'nguyenvananh',0),
(2,'tranthibinh',0),
(2,'leminhchau',0),
(2,'phamdinhdung',0),
(2,'ngothiem',0)
;

select * from user_role;
 SET FOREIGN_KEY_CHECKS = 0;
    truncate user_role;
    SET FOREIGN_KEY_CHECKS = 1;
-- Thêm thông tin cho bảng employee
INSERT INTO employee (name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, username, is_delete)
VALUES
    ('Dinh Hieu', '2001-09-24', '123456789', 3000, '0123456789', 'hieu.dinh@example.com', 'Đồng Nai', 6, 1, 4, 'DinhHieu', 0),
    ('Mai Thy', '1996-12-29', '987654321', 800, '0987654321', 'thy.mai@example.com', 'Bình Dương', 2, 2, 2, 'MaiThy', 0),
    ('Duc Minh', '2001-05-20', '456789012', 600, '0123456789', 'khanh.duc@example.com', 'Thành Phố Hồ Chí Minh', 3, 3, 3, 'DucMinh', 0),
    ('Trung Kien', '1998-07-15', '789012345', 1000, '0987654321', 'trung.kien@example.com', 'Hà Nội', 2, 3, 1, 'KienTrung', 0),
    ('Hoang Nam', '1997-11-30', '901234567', 900, '0123456789', 'hoang.nam@example.com', 'Đà Nẵng', 3, 2, 3, 'NamHoang', 0),
	('Nguyễn Văn Anh', '1995-01-15', '123456789', 1500, '0123456789', 'nguyenvananh@example.com', 'Đồng Nai', 3, 3, 1, 'nguyenvananh', 0),
	('Trần Thị Bình', '1990-03-22', '987654321', 2000, '0987654321', 'tranthibinh@example.com', 'Bình Dương', 4, 4, 2, 'tranthibinh', 0),
	('Lê Minh Châu', '1993-07-10', '456789012', 1800, '0123456789', 'leminhchau@example.com', 'Thành Phố Hồ Chí Minh', 5, 2, 3, 'leminhchau', 0),
	('Phạm Đình Dũng', '1998-05-05', '789012345', 1300, '0901234567', 'phamdinhdung@example.com', 'Thành Phố Hồ Chí Minh', 2, 1, 3, 'phamdinhdung', 0),
	('Ngô Thị Em', '1988-12-01', '543210987', 2500, '0987654321', 'ngothiem@example.com', 'Hải Phòng', 5, 4, 4, 'ngothiem', 0)
ON DUPLICATE KEY UPDATE
    name = VALUES(name);
   SET FOREIGN_KEY_CHECKS = 0;
    truncate employee;
    SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM employee;

-- Thêm thông tin cho bảng customer_type
INSERT INTO customer_type (name, is_delete) VALUES
('Diamond', 0),
('Platinum', 0),
('Gold', 0),
('Silver', 0),
('Member', 0);

SELECT * FROM customer_type;

-- Thêm thông tin cho bảng customer
INSERT INTO customer (customer_type_id, name, gender, date_of_birth, id_card, phone_number, email, address, is_delete) VALUES
(1, 'Nguyễn Lê Đình Hiếu', 1, '1998-02-14', '0123456789', '0987654321', 'dinhhieu@gmail.com', 'Sài Gòn', 0),
(2, 'Nguyễn Thị Mỹ Duyên', 0, '1996-11-30', '9876543210', '0912345678', 'duyennguyen@gmail.com', 'Bình Dương', 0),
(3, 'Lê Văn C', 1, '1987-05-20', '1234567890', '0923456789', 'levanc@gmail.com', 'Quảng Nam', 0),
(4, 'Phạm Thị D', 0, '1995-09-10', '0987654321', '0934567890', 'phamthid@gmail.com', 'Cần Thơ', 0),
(5, 'Hoàng Trần Thành Đạt', 0, '1990-08-25', '1111111111', '0999999999', 'dathoang@gmail.com', 'Đồng Nai', 0),
(2, 'Võ Thị Hương', 0, '1992-03-15', '2222222222', '0988888888', 'vothihuong@gmail.com', 'Hải Dương', 0),
(3, 'Trần Minh Tuấn', 1, '1994-07-02', '3333333333', '0977777777', 'tranminhtuan@gmail.com', 'Hà Nội', 0),
(4, 'Nguyễn Thị Thủy', 0, '1999-11-18', '4444444444', '0966666666', 'nguyenthithuy@gmail.com', 'Đà Nẵng', 0),
(5, 'Lý Hoàng Nam', 1, '1985-09-05', '5555555555', '0955555555', 'lyhoangnam@gmail.com', 'Nghệ An', 0),
(1, 'Nguyễn Thị Loan', 0, '1993-12-20', '6666666666', '0944444444', 'nguyenthiloan@gmail.com', 'Lâm Đồng', 0),
(1, 'Nguyễn Văn Vinh', 1, '1990-01-15', '7777777777', '0911111111', 'vinhnguyen@gmail.com', 'Vinh', 0),
(2, 'Phạm Thị Quỳnh', 0, '1992-08-22', '8888888888', '0922222222', 'quynhpham@gmail.com', 'Quảng Ngãi', 0),
(3, 'Trần Văn Tiến', 1, '1988-05-07', '9999999999', '0933333333', 'tientran@gmail.com', 'Vinh', 0);

-- Hiển thị dữ liệu của bảng khách hàng
SELECT * FROM customer;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE customer;
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM customer;
-- Thêm thông tin cho bảng facility_type

INSERT INTO facility_type (name, is_delete)
VALUES
    ('Villa', 0),
    ('House', 0),
    ('Room', 0);
    
SELECT * FROM facility_type;
-- Thêm thông tin cho bảng rent_type
INSERT INTO rent_type (name, is_delete) VALUES
('Theo giờ', 0),
('Theo ngày', 0),
('Theo tháng', 0),
('Theo năm', 0);

SELECT * FROM rent_type;
-- Thêm thông tin cho dịch vụ villa
INSERT INTO facility (name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, is_delete)
VALUES
    ('Villa 1', 200, 500, 10, 1, 1, 'Phòng đơn', 'Tiện nghi thoải mái', 50.5, 2, 'Wi-Fi miễn phí', 0),
    ('Villa 2', 300, 600, 12, 2, 1, 'Phòng đôi', 'Tiện nghi tiện lợi', 60.5, 2, 'Dịch vụ phòng miễn phí', 0),
    ('Villa 3', 200, 500, 10, 3, 1, 'Phòng gia đình', 'Tiện nghi tốt nhất', 70.5, 2, 'Dịch vụ đỗ xe miễn phí', 0);

-- Thêm thông tin cho dịch vụ house
INSERT INTO facility (name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, is_delete)
VALUES
    ('House 1', 180, 350, 9, 3, 2, 'Chất lượng cao', 'Tiện nghi tốt', NULL, 3, 'Bãi đỗ xe miễn phí', 0),
    ('House 2', 210, 420, 11, 4, 2, 'Cao cấp', 'Tiện nghi đầy đủ', NULL, 4, 'Đỗ xe miễn phí, Wifi miễn phí', 0);

-- Thêm thông tin cho dịch vụ room
INSERT INTO facility (name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, is_delete)
VALUES
    ('Room 1', 80, 100, 2, 1, 3, 'Tiêu chuẩn', 'Tiện nghi thuận tiện', NULL, NULL, 'Dịch vụ miễn phí', 0),
    ('Room 2', 90, 155, 4, 2, 3, 'Cao cấp', 'Tiện nghi cao cấp', NULL, NULL, 'Bữa sáng và dịch vụ phòng miễn phí', 0);
    
SELECT * FROM facility;
-- Thêm thông tin dịch vụ đi kèm
INSERT INTO attach_facility (name, cost, unit, status, is_delete)
VALUES
('Dịch vụ Massage', 20, 'Giờ', 'Sẵn có', 0),
('Phòng Karaoke', 30, 'Giờ', 'Sẵn có', 0),
('Dịch vụ Thức ăn', 10, 'Suất', 'Sẵn có', 0),
('Dịch vụ Nước uống', 5, 'Suất', 'Sẵn có', 0),
('Thuê Xe Di chuyển', 50, 'Ngày', 'Sẵn có', 0),
('Dịch vụ Spa', 25, 'Giờ', 'Sẵn có', 0),
('Dịch vụ Đưa đón', 40, 'Lượt', 'Sẵn có', 0),
('Dịch vụ Hướng dẫn viên du lịch', 60, 'Ngày', 'Sẵn có', 0),
('Dịch vụ Làm đẹp', 15, 'Suất', 'Sẵn có', 0),
('Dịch vụ Giữ trẻ', 35, 'Giờ', 'Sẵn có', 0);

truncate attach_facility;

SELECT * FROM attach_facility;
    -- Thêm thông tin cho bảng contract
INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete)
VALUES
('2022-01-01', '2022-01-10', 200, 2, 1, 1, 0),
('2022-02-15', '2022-03-01', 250, 3, 2, 2, 0),
('2022-04-10', '2022-05-20', 150, 5, 3, 3, 0),
('2022-06-05', '2022-06-15', 180, 5, 4, 4, 0),
('2022-07-01', '2022-08-15', 220, 6, 5, 5, 0),
('2022-09-10', '2022-10-01', 200, 7, 6, 6, 0),
('2022-11-25', '2022-12-05', 300, 8, 7, 7, 0),
('2023-01-12', '2023-02-28', 180, 9, 8, 1, 0),
('2023-03-20', '2023-04-05', 250, 10, 9, 2, 0),
('2023-05-15', '2023-06-01', 200, 1, 10, 3, 0),
('2023-07-10', '2023-07-20', 280, 2, 5, 4, 0);
    
    select * from contract;
    INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete)
VALUES
('2023-07-10', '2023-07-20', 280, 2, 5, 4, 0),
('2023-09-01', '2023-09-15', 220, 3, 6, 5, 0),
('2023-11-05', '2023-11-25', 300, 2, 7, 6, 0);
INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete)
VALUES
('2023-08-15', '2023-09-01', 210, 3, 11, 2, 0),
('2023-10-10', '2023-11-20', 230, 1, 12, 3, 0),
('2023-12-05', '2023-12-15', 240, 5, 13, 4, 0);
INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id, is_delete)
VALUES
('2023-08-15', '2023-09-01', 215, 2, 11, 3, 0),
('2023-10-10', '2023-11-20', 235, 2, 12, 4, 0),
('2023-12-05', '2023-12-15', 245, 2, 13, 5, 0),
('2023-08-15', '2023-09-01', 220, 3, 11, 4, 0),
('2023-10-10', '2023-11-20', 240, 3, 12, 5, 0),
('2023-12-05', '2023-12-15', 250, 3, 13, 6, 0),
('2023-08-15', '2023-09-01', 225, 5, 11, 5, 0),
('2023-10-10', '2023-11-20', 245, 5, 12, 6, 0),
('2023-12-05', '2023-12-15', 255, 5, 13, 7, 0);
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE contract;
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM contract;
-- Thêm thông tin cho bảng contract_detail
INSERT INTO contract_detail (contract_id, attach_facility_id, quantity, is_delete)
VALUES
(1, 1, 2, 0),
(1, 2, 1, 0),
(2, 3, 3, 0),
(3, 4, 1, 0),
(4, 5, 2, 0),
(5, 1, 1, 0),
(5, 2, 1, 0),
(6, 3, 2, 0),
(6, 4, 1, 0),
(7, 5, 3, 0),
(7, 6, 1, 0),
(8, 7, 2, 0),
(8, 8, 1, 0),
(9, 9, 3, 0),
(9, 10, 1, 0),
(10, 1, 1, 0),
(10, 2, 1, 0),
(11, 3, 2, 0),
(11, 4, 1, 0);
    INSERT INTO contract_detail (contract_id, attach_facility_id, quantity, is_delete)
VALUES
(12, 1, 2, 0),
(12, 2, 1, 0),
(13, 3, 3, 0),
(13, 4, 1, 0),
(14, 5, 2, 0),
(14, 6, 1, 0);
INSERT INTO contract_detail (contract_id, attach_facility_id, quantity, is_delete)
VALUES
(15, 1, 2, 0),
(15, 2, 1, 0),
(16, 3, 3, 0),
(16, 4, 1, 0),
(17, 5, 2, 0),
(17, 6, 1, 0);
INSERT INTO contract_detail (contract_id, attach_facility_id, quantity, is_delete)
VALUES
(19, 1, 2, 0),
(19, 2, 1, 0),
(20, 3, 3, 0),
(20, 4, 1, 0),
(21, 5, 2, 0),
(21, 6, 1, 0),
(22, 2, 2, 0),
(22, 3, 1, 0),
(23, 4, 3, 0),
(23, 5, 1, 0),
(24, 6, 2, 0),
(24, 7, 1, 0),
(25, 3, 2, 0),
(25, 4, 1, 0),
(26, 5, 3, 0),
(26, 6, 1, 0);
    truncate contract_detail;
SELECT * FROM contract_detail;
-- Thêm thông tin cho bảng service_type
INSERT INTO service_type (name, is_delete)
VALUES
    ('Dịch vụ đi kèm', 0),
    ('Dịch vụ cho thuê', 0);


SELECT * FROM service_type;
-- Thêm thông tin cho dịch vụ cho thuê (facility)
ALTER TABLE service
ADD COLUMN status varchar(20) not null AFTER unit;
INSERT INTO service (name, price, unit, status, service_type_id, is_delete)
VALUES
    ('Thuê Xe Di chuyển', 50, 'Ngày', 'Sẵn có', 2, 0),
    ('Thuê Karaoke', 30, 'Giờ', 'Sẵn có', 2, 0),
    ('Thuê Villa', 500, 'Ngày', 'Sẵn có', 2, 0),
    ('Thuê House', 350, 'Ngày', 'Sẵn có', 2, 0),
    ('Thuê Phòng', 100, 'Ngày', 'Sẵn có', 2, 0);

SELECT * FROM service;

-- Thêm thông tin cho bảng contract_service (liên kết giữa contract và service)
INSERT INTO contract_service (contract_id, service_id, quantity, is_delete)
VALUES
    (1, 1, 2, 0),  
    (1, 2, 1, 0),   
    (2, 3, 3, 0),   
    (3, 4, 1, 0),   
    (4, 5, 2, 0);  
INSERT INTO contract_service (contract_id, service_id, quantity, is_delete)
VALUES

  (5, 1, 2, 0),
    (5, 2, 1, 0),
    (6, 3, 3, 0),
    (7, 4, 1, 0),
    (7, 5, 2, 0);
SELECT * FROM contract_service;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * 
from employee
where (name like 'H%' or name like 'T%' or name like 'K%')
and length(name)<=15;




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

    
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select
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
where
    customer_type.name = 'Diamond'
    and (customer.address = 'Vinh' or customer.address = 'Quảng Ngãi');
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
join
    employee on contract.employee_id = employee.id
join
    customer on contract.customer_id = customer.id
join
    contract_service on contract.id = contract_service.contract_id
join
    service on contract_service.service_id = service.id
where
    year(contract.start_date) = 2022
    and (month(contract.start_date) in (10, 11, 12) or month(contract.end_date) in (10, 11, 12))
    and contract.id not in (
        select contract.id
        from contract
        join contract_service on contract.id = contract_service.contract_id
        where year(contract.start_date) = 2023
        group by contract.id
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
-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2022 đến 2023.
SELECT
    employee.id AS 'ma_nhan_vien',
    employee.name AS 'ho_ten',
    education_degree.name AS 'ten_trinh_do',
    position.name AS 'ten_bo_phan',
    employee.phone_number AS 'so_dien_thoai',
    employee.address AS 'dia_chi'
FROM
    employee
JOIN
    contract ON employee.id = contract.employee_id
JOIN
    education_degree ON employee.education_degree_id = education_degree.id
JOIN
    position ON employee.position_id = position.id
WHERE
    YEAR(contract.start_date) BETWEEN 2022 AND 2023
GROUP BY
    employee.id
HAVING
    COUNT(contract.id) <= 3;
-- 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2022 đến năm 2023.
-- Hiển thị thông tin nhân viên và số hợp đồng đã ký
select
    employee.id as 'manhanvien',
    name as 'hotennhanvien',
    email as 'email',
    phone_number as 'sodienthoai',
    count(contract.id) as 'sohopdong'
from
    employee
left join
    contract on contract.employee_id = employee.id and year(start_date) between 2022 and 2023
group by
    employee.id
having
    count(contract.id) = 0;

-- Xóa nhân viên chưa từng lập hợp đồng từ năm 2022 đến 2023
delete from employee
where
    id in (
        select
            id
        from
            employee
        left join
            contract on id = employee_id and year(start_date) between 2022 and 2023
        group by
            id
        having
            count(contract_id) = 0
    );
    
-- 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2022
-- Hiển thị thông tin khách hàng Platinum có số tiền đặt phòng > 10,000,000 VNĐ
select
    contract.customer_id as 'makhachhang',
    customer.name as 'tenkhachhang',
    customer_type.name ,
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
        AND YEAR(contract.start_date) = 2022
group by
    contract.customer_id
having
    tongtiendatphong > 1000
order by
    tongtiendatphong desc;
-- Cập nhật khách hàng lên kim cương
UPDATE customer
SET customer_type_id = (SELECT id FROM customer_type WHERE name = 'Diamond')
WHERE customer_type_id = (SELECT id FROM customer_type WHERE name = 'Platinum')
    AND id IN (
        SELECT
            contract.customer_id	
        FROM
            contract
        JOIN
            contract_detail ON contract.id = contract_detail.contract_id
        JOIN
            attach_facility ON contract_detail.attach_facility_id = attach_facility.id
        LEFT JOIN
            facility ON attach_facility.id = facility.id
        WHERE
            contract.is_delete = 0
        GROUP BY
            contract.customer_id
        HAVING
            SUM(facility.cost + (contract_detail.quantity * attach_facility.cost)) > 1000
    );
--  18.	Xóa những khách hàng có hợp đồng trước năm 2022 (chú ý ràng buộc giữa các bảng).
SELECT 
    customer.id, customer.name
FROM
    customer
        JOIN
    contract ON contract.customer_id = customer.id
WHERE
    contract.customer_id IN (SELECT 
            contract.customer_id
        FROM
            contract
        WHERE
            YEAR(contract.start_date) < 2022)
GROUP BY customer.id;
select * from customer;
insert into contract(start_date,end_date,deposit,employee_id,customer_id,facility_id,is_delete) values 
('2021-12-05', '2021-12-30', 500, 8, 13, 7, 0);
select * from contract;
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.    
-- Hiển thị các dịch vụ được sử dụng trên 5 lần trong năm 2022
select 
	attach_facility.id as 'MaDichVuDiKem' , contract_detail.quantity,attach_facility.cost
from attach_facility
join contract_detail on attach_facility.id = contract_detail.attach_facility_id
join contract on contract_detail.contract_id = contract.id
where contract_detail.quantity > 5
and year(contract.start_date)= 2022 
order by  contract_detail.quantity asc;       
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
    
