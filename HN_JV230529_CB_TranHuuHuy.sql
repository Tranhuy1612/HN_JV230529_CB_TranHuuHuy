CREATE DATABASE QUANLIDIEMTHI ;
USE QUANLIDIEMTHI;
CREATE TABLE student(
StudentId varchar(4) primary key not null,
StudentName varchar(100) not null,
birthday DATE not null,
gender BIT(1) not null ,
address TEXT not null ,
phoneNumber varchar(45) UNIQUE
);
CREATE TABLE subject (
subjectId varchar(4) primary key not null,
subjectName varchar(45) not null,
priority int(11) not null
);
CREATE TABLE mark (
subjectId varchar(4) not null,
StudentId varchar(4) not null,
foreign key (subjectId) references subject(subjectId),
foreign key (StudentId) references student(StudentId),
point float(11) not null
);

-- Thêm dữ liệu vào bảng student
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S001','Nguyễn Thế Anh','1999-1-11',1,'Hà Nội','0984678082');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai','904982654');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S003','Trần Hà Phương','2000-5-5',0,'Nghệ An','947645363');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nội','983665353');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S005','Phạm Duy Nhất','1998-10-4',1,'Tuyên Quang','987242678');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S006','Mai Văn Thái','2002-6-22',1,'Nam Định','982654268');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S007','Giang Gia Hân','1996-11-10',0,'Phú Thọ','982364753');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S008','Nguyễn Ngọc Bảo My','1999-1-22',0,'Hà Nam','927867453');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S009','Nguyễn Tiến Đạt','1998-8-7',1,'Tuyên Quang','989274673');
insert into student(StudentId,StudentName,birthday,gender,address,phoneNumber)values('S010','Nguyễn Thiều Quang','2000-9-18',1,'Hà Nội','984378291');

-- Thêm dữ dữ liệu vào bảng subject
insert into subject(subjectId,subjectName,priority) values('MH01','Toán',2);
insert into subject(subjectId,subjectName,priority) values('MH02','Vật Lý',2);
insert into subject(subjectId,subjectName,priority) values('MH03','Hóa Học',1);
insert into subject(subjectId,subjectName,priority) values('MH04','Ngữ Văn',1);
insert into subject(subjectId,subjectName,priority) values('MH05','Tiếng Anh',2);

-- Thêm dữ liệu vào bảng Mark
insert into mark(studentId,subjectId,point) values 
("S001","MH01", 8.5),("S001","MH02", 7),("S001","MH03", 9),("S001","MH04", 9),("S001","MH05", 5),
("S002","MH01", 9),("S002","MH02", 8),("S002","MH03", 6.5),("S002","MH04", 8),("S002","MH05", 6),
("S003","MH01", 7.5),("S003","MH02", 6.5),("S003","MH03", 8),("S003","MH04", 7),("S003","MH05", 7),
("S004","MH01", 6),("S004","MH02", 7),("S004","MH03", 5),("S004","MH04", 6.5),("S004","MH05", 8),
("S005","MH01", 5.5),("S005","MH02", 8),("S005","MH03", 7.5),("S005","MH04", 8.5),("S005","MH05", 9),
("S006","MH01", 8),("S006","MH02", 10),("S006","MH03", 9),("S006","MH04", 7.5),("S006","MH05", 6.5),
("S007","MH01", 9.5),("S007","MH02", 9),("S007","MH03", 6),("S007","MH04", 9),("S007","MH05", 4),
("S008","MH01", 10),("S008","MH02", 8.5),("S008","MH03", 8.5),("S008","MH04", 6),("S008","MH05", 9.5),
("S009","MH01", 7.5),("S009","MH02", 7),("S009","MH03", 9),("S009","MH04", 5),("S009","MH05", 10),
("S010","MH01", 6.5),("S010","MH02", 8),("S010","MH03", 5.5),("S010","MH04", 4),("S010","MH05", 7);

-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
update student
set StudentName = 'Đỗ Đức Mạnh'
where StudentId = 'S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
update subject
set subjectName = 'NgoạiNgữ', priority = 1
where subjectId = 'MH05';

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
update mark
set point = case
    WHEN subjectId = 'MH01' then 8.5
    WHEN subjectId = 'MH02' then 7
    WHEN subjectId = 'MH03' then 5.5
    WHEN subjectId = 'MH04' then 6
    WHEN subjectId = 'MH05' then 9
    else point
end
where StudentId = 'S009';

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT. 
delete from mark where studentId = 'S010';
delete from student where studentId = 'S010';

-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student .
select * from student;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
select subjectName , subjectId 
from subject
where priority = 1;

-- 3.Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
select studentId , studentName , YEAR(CURDATE()) - YEAR(birthday) AS Tuổi , 
CASE WHEN gender = 1 THEN 'Nam'WHEN gender = 0 THEN 'Nữ' END Giới_tính, address
from student;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , 
-- điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.
select s.studentId, sb.subjectName, m.point
from student s
join mark m on s.studentId = m.studentId
join subject sb on sb.subjectId = m.subjectId 
where sb.subjectName = 'Toán'
order by m.point desc;  

-- 5.Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
select 
    case
        when gender = 1 then 'Nam'
        when gender = 0 then 'Nữ'
    end Giới_tính, COUNT(*)  Số_lượng
from student
group by gender;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select m.StudentId , s.StudentName,sum(m.point) 'Tổng điểm',avg(m.point) 'điểm trung bình'
 from mark m join student s on s.studentId = m.studentId 
group by m.StudentId, s.studentName;

-- 1.Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán .
create view STUDENT_VIEW as
select StudentId, StudentName,
       case
           when gender = 1 then 'Nam'
           when gender = 0 then 'Nữ'
       end as Gender,address 
from student;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học
create view AVERAGE_MARK_VIEW as
select s.StudentId, s.StudentName, avg(m.point) AS 'Điểm trung bình'
from student s
join mark m on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName;

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT.
create index idx_phoneNumber on student (phoneNumber);

-- 4 Tạo các PROCEDURE sau :
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó
DELIMITER //
create procedure PROC_INSERTSTUDENT (
    in p_StudentId varchar(4),
    in p_StudentName varchar(100),
    in p_Birthday DATE,
    in p_Gender BIT(1),
    in p_Address TEXT,
    in p_PhoneNumber varchar(45)
)
begin
    insert into student (StudentId, StudentName, birthday, gender, address, phoneNumber)
    values (p_StudentId, p_StudentName, p_Birthday, p_Gender, p_Address, p_PhoneNumber);
end //
DELIMITER ;

-- Tạo PROC_DELETEMARK dùng để xóa toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa 
DELIMITER //
create procedure PROC_DELETEMARK(in p_studentId varchar(4),out p_numDeleted INT)
begin
declare num_deleted INT;
delete from mark
where studentId = p_studentId;
set p_numDeleted = row_count();
end //
DELIMITER ;


