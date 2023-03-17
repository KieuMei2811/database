CREATE DATABASE QLy_QN;
USE QLy_QN;

CREATE TABLE Danh_Muc(
    MaDM VARCHAR(6) NOT NULL,
    TenDM VARCHAR(50) NOT NULL,
    PRIMARY KEY (MaDM)
    );
    
CREATE TABLE lOAI_DM(
   MaLoai VARCHAR(6) NOT NULL,
   TenLoai VARCHAR(50) NOT NULL,
   Gia   FLOAT,
   MaDM VARCHAR(6) NOT NULL,
   PRIMARY KEY(MaLoai),
   FOREIGN KEY (MaDM) REFERENCES Danh_Muc(MaDM)
);
	
CREATE TABLE Nhan_Vien(
    MaNV VARCHAR(6) NOT NULL,
    TeNV VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(100),
    Gtinh  VARCHAR(1),
    NSinh  DATE,
    Phone   VARCHAR(20),
    PRIMARY KEY (MaNV)
    );
    
CREATE TABLE Khach_Hang(
   MaKH VARCHAR(6) NOT NULL,
   TenKH VARCHAR(50),
   Phone VARCHAR(20),
   Email VARCHAR(50),
   PRIMARY KEY (MaKH)
   );
   
CREATE TABLE Don_Hang(
   MaDH VARCHAR(6) NOT NULL, 
   MaKH VARCHAR(6) ,
   MaNV VARCHAR(6), 
   TongGia  FLOAT ,
   PRIMARY KEY (MaDH),
   FOREIGN KEY(MaKH) REFERENCES Khach_Hang(MaKH),
   FOREIGN KEY(MaNV)  REFERENCES Nhan_Vien(MaNV)
   );
   
CREATE TABLE ChiTiet_DH(
	MaCTDH  VARCHAR(6) NOT NULL,
	MaLoai VARCHAR(6),
    Gia  FLOAT,
    SoLuong  INT ,
    TongGia  FLOAT ,
    PRIMARY KEY (MaCTDH),
    FOREIGN KEY (MaLoai)
    
    
     