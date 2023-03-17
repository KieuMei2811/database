Create database QL_NhapXuat;
Use QL_NhapXuat;

Create table Loai_Hang(
  Maloai VARCHAR(3) NOT NULL,
  Tenloai  VARCHAR(30) NOT NULL,
  PRIMARY KEY(Maloai)
  );
  
Create table Hang_Hoa(
  Mahang VARCHAR(6) NOT NULL,
  Maloai VARCHAR(3) ,
  Tenhang VARCHAR(50) NOT NULL,
  PRIMARY KEY(Mahang),
  FOREIGN KEY(Maloai) REFERENCES loai_hang (Maloai)
  );
  
  Create table Nha_cungCap(
   MaNCC  VARCHAR(10) NOT NULL,
   TenNCC VARCHAR(30) NOT NULL,
   Diachi  VARCHAR(100) NOT NULL,
   Dienthoai VARCHAR(15),
   PRIMARY KEY (MaNCC)
   );
   
   
   Create table Nhan_Vien(
  MaNV  VARCHAR(10) NOT NULL,
  TenNV  VARCHAR(30)NOT NULL,
  UseName  VARCHAR(20),
  Passwords VARCHAR(20),
  PRIMARY KEY (MaNV)
  );


Create table HoaDon_Nhap(
  MaHD  VARCHAR(10) NOT NULL,
  Ngay  DATETIME  NOT NULL,
  MaNCC VARCHAR(10),
  MaNV  VARCHAR(10),
  Diengiai  VARCHAR(100),
  PRIMARY KEY(MaHD),
  FOREIGN KEY (MaNCC) REFERENCES Nha_cungCap(MaNCC),
  FOREIGN KEY (MaNV) REFERENCES Nhan_Vien(MaNV)
  );
  
  
  Create table CTHD_Nhap(
   MaHD  VARCHAR(10) NOT NULL,
   Mahang  VARCHAR(6),
   Soluong SMALLINT(6) NOT NULL,
   Dongia FLOAT (7,1)NOT NULL,
   PRIMARY KEY (MaHD,Mahang),
   FOREIGN KEY (MaHD) REFERENCES HoaDon_Nhap (MaHD),
   FOREIGN KEY (Mahang) REFERENCES Hang_Hoa(Mahang)
   );
   

Create table Khach_Hang(
  MaKH  VARCHAR(10) NOT NULL,
  TenKH VARCHAR(30) NOT NULL,
  Diachi VARCHAR(100),
  Dienthoai VARCHAR(15),
  PRIMARY KEY (MaKH)
  );
  
  Create table HoaDon_Xuat(
  MaHD  VARCHAR(10) NOT NULL,
  Ngay  DATETIME NOT NULL,
  MaNV  VARCHAR(10),
  MaKH  VARCHAR(10),
  Diengiai  VARCHAR(100),
  PRIMARY KEY (MaHD),
  FOREIGN KEY (MaNV) REFERENCES Nhan_Vien (MaNV),
  FOREIGN KEY (MaKH) REFERENCES Khach_Hang (MaKH)
  );
  
  
  Create table CTHD_Xuat(
   MaHD  VARCHAR(10) NOT NULL,
   Mahang VARCHAR(6),
   Soluong  SMALLINT(6) NOT NULL,
   Dongia    FLOAT(7,1) NOT NULL,
   PRIMARY KEY (MaHD,Mahang),
    FOREIGN KEY (MaHD) REFERENCES HoaDon_Xuat(MaHD),
   FOREIGN KEY (Mahang) REFERENCES Hang_Hoa(Mahang)
   );
  
   
   
   
insert into Loai_Hang( Maloai, Tenloai)
values ('01', 'But Chi'),
	   ('02', 'MiLo'),
       ('03', 'Snack'),
       ('04', 'Duong trang'),
       ('05', 'Ao Thun'),
       ('06', 'Quan Jean');
       
       
 
 select *from HoaDon_Nhap;
update Loai_Hang
set Tenloai='Duong Trang'
where Maloai='4';

insert into Hang_Hoa(Mahang,Maloai,Tenhang)
values ('B1','01','But'),
       ('S2','02','Sua'),
       ('O3','03','Oshi'),
       ('D4','04','Duong'),
       ('A5','05','Thun'),
       ('Q6','06','Quan');
       

insert into Nha_cungCap(MaNCC,TenNCC,Diachi,Dienthoai)
values ('M1','Dong Tien','137-Hai Ba Trung','0769547186'),
	   ('M2','Hai Doo','137-Quang Trung','0392375816'),
       ('M3','Ba Chay','101B-Le Huu Trac','0123456789'),
       ('M4','Be Bun','156-Nguyen Hue','0392376821'),
       ('M5','Ba Xom','203-Tran Duy Hung','0387962191'),
       ('M6','Teo Em','37-Tran Hung Dao','0987623412');
select*from Nhan_Vien;

insert into Nhan_Vien(MaNV,TenNV,UseName,Passwords)
values ('N1','Ha Chi Vu','Ho Thi Kieu','Vu123'),
       ('N2','Nguyen Ha May','Tran Nhan','May234'),
       ('N3','Tran Thi Tu','MissThy','Tu123'),
       ('N4','Hai Dang Doo','Lan Huong','Doo123'),
       ('N5','Tuan Tran','Mai Anh','Anh321'),
       ('N6','Duy Anh','Vu Le','Le123');
       
insert into HoaDon_Nhap(MaHD,Ngay,MaNCC,MaNV,Diengiai)
values ('H1','2022-05-28','M2','N4',null),
       ('H2','2022-11-23','M1','N1',null),
       ('H3','2022-12-01','M4','N3',null),
       ('H4','2022-10-10','M1','N2',null),
       ('H5','2022-06-22','M3','N5',null),
       ('H6','2022-02-28','M6','N6',null);
       
insert into CTHD_Nhap(MaHD,Mahang,Soluong,Dongia)
values ('H1','S2','10','20.000'),
       ('H2','O3','30','6.000'),
       ('H3','D4','20','11.000'),
       ('H4','B1','15','5.000'),
       ('H5','A5','20','40.000'),
       ('H6','Q6','50','50.000');
       
       
insert into Khach_Hang(MaKH,TenKH,Diachi,Dienthoai)
values ('K1','Ho Thi Tai','Dakrong-Quang Tri','0392816021'),
       ('K2','Dinh Ngoc Son','Minh Hoa-Quang Binh','0983256714'),
       ('K3','Ho Thi Bich','Vinh Linh-Quang Tri','0768435769'),
       ('K4','Ho Van Di','Huong Hoa-Quang Tri','0757901226'),
       ('K5','Ho Thi Kieu','Son Tra-Da Nang','0392375641'),
       ('K6','Tran Thai Nhat Tan','Thi Xa-Quang Tri','0768435218');
       
       
insert into HoaDon_Xuat(MaHD,Ngay,MaNV,MaKH,Diengiai)
values ('H1','2022-06-28 ', 'N4','K1',null),
       ('H2','2022-11-29 ', 'N1','K3',null),
       ('H3','2022-12-28 ', 'N3','K4',null),
       ('H4','2022-10-20',  'N2','K2',null),
       ('H5','2022-06-27',  'N5','K6',null),
       ('H6','2022-03-01',  'N6','K5',null);
       
insert into CTHD_Xuat(MaHD,Mahang,Soluong,Dongia)
values ('H1','S2','10','20.000'),
       ('H2','O3','25','6.000'),
       ('H3','D4','18','11.000'),
       ('H4','B1','14','5.000'),
       ('H5','A5','20','40.000'),
       ('H6','Q6','30','50.000');
       


-- Cau 1 :Cho biết doanh số xuất của từng mặt hàng trong 6 tháng đầu năm nay. 
Create view DoanhSo as select sum(Soluong) as SoLuongXuat,Tenhang,Tenloai,Diengiai,Ngay 
from Hang_Hoa, HoaDon_Xuat, CTHD_Xuat, Loai_Hang
where year(Ngay) = year(now()) and month(Ngay) <= 6 and HoaDon_Xuat.MaHD = CTHD_Xuat.MaHD 
and CTHD_Xuat.Mahang = Hang_Hoa.Mahang and hang_hoa.maloai=loai_hang.maloai
Group by CTHD_Xuat.Mahang;

-- Cau 2 :Cho biết mặt hàng có doanh số xuất lớn nhất. 
Create view Max_DoanhSO as select Tenhang,Tenloai,SoLuongXuat,Diengiai,Ngay
from DoanhSo where SoLuongXuat=(select max(SoLuongXuat) from DoanhSo);

-- Cau 3:Cho biết mặt hàng có tổng doanh số lớn hơn 100.

Create view Total_DoanhSO as select CTHD_Xuat.Mahang,Tenhang,Tenloai,sum(Soluong) 
from CTHD_Xuat, Hang_Hoa,Loai_Hang 
where CTHD_Xuat.Mahang = Hang_Hoa.Mahang and Hang_Hoa.Maloai = Loai_Hang.Maloai 
Group by CTHD_Xuat.Mahang 
Having sum(Soluong)  >= 100;

-- Cau 4:Cho biết đơn giá nhập trung bình của từng mặt hàng nhập

select CTHD_Nhap.Mahang,Tenhang,Tenloai, AVG(Dongia/Soluong)
from CTHD_Nhap, Hang_Hoa,Loai_Hang 
where CTHD_NHap.Mahang = Hang_Hoa.Mahang and Hang_Hoa.Maloai = Loai_Hang.Maloai
Group by CTHD_NHap.Mahang
Having AVG(Dongia/Soluong);
-- Cau 5:Cho biết báo cáo chi tiết về số lượng theo từng loại hàng, từng mặt hàng, tổng tất cả. 

Create view BCCT_MH as select Mahang,Tenhang,Tenloai, sum(Soluong)
From 
Where 
-- Cau 6:Cho biết thành tiền của từng mặt hàng theo từng hóa đơn và tổng tiền của từng hóa đơn. 

-- THUC HANH 2 --
-- Cau 7:Tạo view: Hiện thông tin về hoá đơn nhập: Ngày, diễn giải, tổng tiền trong tháng hiện tại được sắp xếp theo ngày. 
-- Cau 8:Tạo view: Cho biết thông tin nhân viên chưa nhập hàng bao giờ. 
Create View NV
As Select Nhan_Vien.MaNV,TenNV,UserName
From Nhan_Vien
Where Not exists 
     (Select HoaDon_Nhap.MaNV
     From HoaDon_Nhap Where Nhan_Vien.MaNV = HoaDon_Nhap.MaNV);                                                                                                                                                                                                                                                                                
-- Cau 9:Tạo và mã hóa view: Cho biết thông những mặt hàng chưa được xuất trong năm hiện tại
-- Cau 10:Tạo view: cho biết danh sách mặt hàng thuộc loại ‘L01’. Sau đó chèn thử một bản ghi vào view này. 

Create View LH as
Select Mahang,Maloai, Tenhang
From Hang_Hoa
Where Maloai = 'L01';

Insert into LH (Mahang,Maloai,Tenhang)
Values ('L02','07','Sach');

-- THUC HANH 3 --

-- Cau 1:
-- Cau 2:
-- Cau 3:
-- Cau 4:
-- Cau 5:

-- THUC HANH 4 --
-- Cau 1:
-- Cau 2:
-- Cau 3:
-- THUC HANH 5 --
-- Cau 1:
-- Cau 2:
-- THUC HANH 6 --
-- Cau 5:


Create View TTHD_Xuat as Select Ngay,CTHD_Xuat.MaHD , Mahang, Soluong
From  CTHD_Xuat, HoaDon_Xuat
Where  month(Ngay) = 11 and HoaDon_Xuat.MaHD = CTHD_Xuat.MaHD 
group by CTHD_Xuat.MaHD ;




