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
   FOREIGN KEY (Mahang) REFERENCES Hang_Hoa(Mahang)
   );
  
   