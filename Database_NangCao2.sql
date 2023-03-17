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
values ('H1','S2','05','20.000'),
       ('H2','O3','25','6.000'),
       ('H3','D4','18','11.000'),
       ('H4','B1','14','5.000'),
       ('H5','A5','20','40.000'),
       ('H6','Q6','30','50.000');
       


-- Cau 1 :      
Create view DoanhSo as select sum(Soluong) as SoLuongXuat,Tenhang,Diengiai,Ngay 
from Hang_Hoa, HoaDon_Xuat, CTHD_Xuat
where year(Ngay) = year(now()) and month(Ngay) <= 6 and HoaDon_Xuat.MaHD = CTHD_Xuat.MaHD 
and CTHD_Xuat.Mahang = Hang_Hoa.Mahang
Group by CTHD_Xuat.Mahang;

select*from DoanhSo;

-- Cau 2:
Create view  DoanhSoLonNhat as  select max(Soluong) as SoLuongLonNhat, Tenhang, Mahang from CTHD_Xuat, Hang_Hoa, HoaDon_Xuat
where CTHD_Xuat.Mahang = Hang_Hoa.Mahang and HoaDon_Xuat.MaHD = CTHD_Xuat.MaHD
Group by CTHD_Xuat.Mahang;

create view max_DoanhSO as 
	select Mahang, Maloai,Tenhang,max_Soluong
    from  CTHD_Xuat, Hang_Hoa, HoaDon_Xuat
    where  = (select max(sales) from exp_sales);


-- Cau 3:
select 







