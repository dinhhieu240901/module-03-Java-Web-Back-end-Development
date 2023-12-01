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