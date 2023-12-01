-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * 
from employee
where (name like 'H%' or name like 'T%' or name like 'K%')
and length(name)<=15;
