Create database quanlysinhvien;
Use quanlysinhvien;

Create table SINHVIEN(
	MaSV  VARCHAR(6) NOT NULL,
    HoTen VARCHAR(30),
    NgaySinh DATE,
    NoiSinh VARCHAR(40),
    DiemDV  FLOAT,
    PRIMARY KEY(MaSV)
    );
    
 call quanlysinhvien.Nhap_DL('21C124', 'Ho Thi Kieu', '2003-11-28', 'Quang Tri', 7);   
