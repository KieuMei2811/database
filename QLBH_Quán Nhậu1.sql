CREATE TABLE loai_hang(
      Maloai VARCHAR(6) NOT NULL,
      Tenloai VARCHAR(20) NOT NULL,
      PRIMARY KEY (Maloai)
      );
      
CREATE TABLE mat_hang(
	 Mahang VARCHAR(6) NOT NULL,
	 Maloai VARCHAR(6) NOT NULL,
     Tenhang VARCHAR(20) NOT NULL,
     PRIMARY KEY (Mahang),
     FOREIGN KEY (Maloai) REFERENCES loai_hang(Maloai)
     );
     
CREATE TABLE Nhan_Vien(
	MaNV VARCHAR(6) NOT NULL,
    TenNV VARCHAR(20) NOT NULL,
    PRIMARY KEY (MaNV)
    );
    
CREATE TABLE khach_hang(
	MaKH VARCHAR(6) NOT NULL,
	TenKH VARCHAR(20) NOT NULL,
    PRIMARY KEY (MaKH)
    );
    
CREATE TABLE ban_an(
    Maban VARCHAR(6) NOT NULL,
    MaKH VARCHAR(6) NOT NULL,
    Tenban VARCHAR(20) NOT NULL,
    SOluong VARCHAR(10),
    PRIMARY KEY (Maban),
    FOREIGN KEY (MaKH) REFERENCES khach_hang(MaKH)
    );

CREATE TABLE hoa_don(
    