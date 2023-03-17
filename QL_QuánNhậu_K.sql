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
   DVT VARCHAR(20),
   GiaBan   FLOAT,
   MaDM VARCHAR(6) NOT NULL,
   PRIMARY KEY(MaLoai),
   FOREIGN KEY (MaDM) REFERENCES Danh_Muc(MaDM)
);

CREATE TABLE BAN(
   MaBan VARCHAR(6),
   TenBan VARCHAR(30),
   LoaiBan VARCHAR(30),
   PRIMARY KEY (MaBan)
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
   MaBan VARCHAR(6),
   PRIMARY KEY (MaKH),
   FOREIGN KEY (MaBan) REFERENCES BAN (MaBan)
   );
   
CREATE TABLE Don_Hang(
   MaDH VARCHAR(6) NOT NULL, 
   MaKH VARCHAR(6) ,
   MaNV VARCHAR(6), 
   NGAY  DATETIME ,
   PRIMARY KEY (MaDH),
   FOREIGN KEY(MaKH) REFERENCES Khach_Hang(MaKH),
   FOREIGN KEY(MaNV)  REFERENCES Nhan_Vien(MaNV)
   );
   
CREATE TABLE ChiTiet_DH(
	MaCTDH  VARCHAR(6) NOT NULL,
	MaLoai VARCHAR(6),
    GiaBan  FLOAT,
    SoLuong  INT ,
    TongGia  FLOAT ,
	MaDH VARCHAR(6),
    PRIMARY KEY (MaCTDH),
    FOREIGN KEY (MaLoai) REFERENCES lOAI_DM(MaLoai),
	FOREIGN KEY (MaDH) REFERENCES Don_Hang (MaDH)
    );
    
-- Nhập
INSERT INTO Danh_Muc(MaDM, TenDM)
VALUES ('DM01', 'Bia'),
	   ('DM02', 'Mon Nhau'),
       ('DM03', 'Ruou'),
       ('DM04', 'Nuoc Uong Giai Ruou');
       
INSERT INTO  lOAI_DM(MaLoai, TenLoai,DVT,GiaBan,MaDM)
VALUES ('ML01','Bia SG','Lon','12000','DM01'),
       ('ML02','Bia HN','Ket','225000','DM01'),
       ('ML03','Tiger Nau 330ml','Ket','400000','DM01'),
       ('ML04','Bia HuDa 330ml','Ket','260000','DM01'),
       ('ML05','Bia 333 330ml','Ket','295000','DM01'),
       ('ML06','Ga Quay','Nguyen Con','100000','DM02'),
       ('ML07','Heo Quay','Dau Heo','290000','DM02'),
       ('ML08','Vit Quay','Nguyen Con','47000','DM02'),
       ('ML09','Bo Quay','Mieng','200000','DM02'),
       ('ML10','Ruou Vang','Chai','500000','DM03'),
       ('ML11','Ruou Rum','Chai','250000','DM03'),
       ('ML12','Ruou Can','Chai','249000','DM03'),
       ('ML13','CoCaCoLa','Chai','20000','DM04'),
       ('ML14','Nuoc Gung','Chai','15000','DM04'),
       ('ML15','Pepsi ','Chai','20000','DM04'),
       ('ML16','7 Up','Chai','20000','DM04');

INSERT INTO BAN(MaBan,TenBan,LoaiBan)
VALUES ('B01','Ban 1','Thuong'),
       ('B02','Ban 2','Thuong'),
       ('B03','Ban 3','Vip'),
       ('B04','Ban 4','Thuong'),
       ('B05','Ban 5','Thuong'),
       ('B06','Ban 6','Thuong'),
       ('B07','Ban 7','Thuong'),
       ('B08','Ban 8','Vip Pro');


INSERT INTO Nhan_Vien(MaNV, TeNV, DiaChi, Gtinh, NSinh, Phone)
VALUES ('NV01','Ho Thi Kieu','Quang Tri','F','2003-11-28','0768547186'),
       ('NV02','Ho Thi Thu Tran','Quang Nam','F','2003-10-10','0392375816'),
       ('NV03','Bui Thi Thanh Thuy','Quang Tri','F','2003-09-11','0923425668'),
       ('NV04','Ha Chi Vu','Da Nang','M','2004-07-29','0392871234');
    
    
 INSERT INTO Khach_Hang(MaKH,TenKH,Phone,Email,MaBan)
 VALUES ('KH01','Ho Thi Tai','0392375816','tai.ho24@','B01'),
        ('KH02','Ho Thi Loan','0123456789','loan.ho24@','B02'),
        ('KH03','Ho Thi Bich','0987125436','bich.ho24@','B05'),
        ('KH04','Phan Thu Huong','0368790113','huong.phan24@','B08'),
        ('KH05','Dang Mui Nai','0987689123','nai.dang24@','B03'),
        ('KH06','Y Mua','0989076123','mua.y24@','B02');
 
 
 INSERT INTO Don_Hang(MaDH,MaKH,MaNV,NGAY)
 VALUES ('DH01','KH01','NV02','2022-01-19'),
        ('DH02','KH03','NV02','2022-10-20'),
        ('DH03','KH02','NV01','2022-06-29'),
        ('DH04','KH06','NV04','2022-03-10'),
        ('DH05','KH05','NV01','2022-11-28'),
        ('DH06','KH03','NV03','2022-07-01');
 
 INSERT INTO ChiTiet_DH(MaCTDH,MaLoai,GiaBan,SoLuong,TongGia,MaDH)
 VALUES ('CT01','ML01','12000','2','24000','DH01'),
        ('CT02','ML02','225000','1','225000','DH02'),
        ('CT03','ML11','250000','3','750000','DH03'),
        ('CT04','ML08','47000','2','94000','DH04'),
        ('CT05','ML09','200000','4','80000','DH05'),
        ('CT06','ML09','200000','2','400000','DH06');
      
 -- VIEW --
 -- 1*** Cho biết giá trung bình của từng loại Danh Mục
 CREATE VIEW Gia_TB as select ChiTiet_DH.MaLoai,TenDM,TenLoai,DVT,Loai_DM.GiaBan, 
 AVG(ChiTiet_DH.GiaBan/SoLuong)
 FROM ChiTiet_DH, Danh_Muc, Loai_DM
 WHERE ChiTiet_DH.MaLoai = Loai_DM.MaLoai and Danh_Muc.MaDM = Loai_DM.MaDM
 GROUP BY ChiTiet_DH.MaLoai;
 
 -- 2*** Hiển thị thông tin về đơn hàng: Tên Khách Hàng,Phone,Ngày,Số Lượng, 
 --  Tổng Giá trong tháng hiện tại được sắp xếp theo ngày.
 CREATE VIEW TT_DH as select TenKH, Phone, NGAY, SoLuong, TongGia 
 FROM Khach_Hang, Don_Hang, ChiTiet_DH
 Where month(NGAY) = month(now()) 
 and Khach_Hang.MaKH = Don_Hang.MaKH 
 and Don_Hang.MaDH = ChiTiet_DH.MaDH 
 order by NGAY ASC;
 
 -- 3*** Cho biết thông tin nhân viên chỉ phục vụ một lần.
 CREATE VIEW NV_PV as select Nhan_Vien.MaNV,TeNV,DiaChi,Gtinh,NSinh,Phone, Ngay, COUNT(don_hang.manv) as 'solan'
 FROM Nhan_Vien,Don_Hang 
 WHERE  Nhan_Vien.MaNV = Don_Hang.MaNV  GROUP BY (Don_Hang.MaNV) having count(don_hang.manv)=1 ;
 
 -- Stored Procedure --
 -- 4*** Viết thủ tục xóa nhân viên bạn muốn xóa
 delimiter //
 CREATE PROCEDURE delete_NV (IN A VARCHAR (6))
 BEGIN 
      DELETE from nhan_vien
      WHERE MaNV = A;
END //
delimiter ;
 SET SQL_SAFE_UPDATES = 0;
Set foreign_key_checks = 0;

-- 5*** Viết thủ tục cập nhật lại Nhân Viên với mã 'NV02' thành mã bạn muốn
delimiter //
 CREATE PROCEDURE update_NV (IN b VARCHAR(6) )
 BEGIN 
      UPDATE nhan_vien
      SET MaNV = b
      WHERE MaNV = 'NV03';
 END //
 delimiter 
 -- 6*** Viết thủ tục hiển thị số lượng bàn trống 
 delimiter 
 CREATE PROCEDURE HTSL_Ban (out BanTrong INT)
 BEGIN
 SET BanTrong =(select count(maban)
 FROM ban 
 WHERE maban not in(select khach_hang.maban FROM ban,khach_hang WHERE ban.maban=khach_hang.maban));    
 end;
 
-- Function --
-- *** 
 
 
 
 

