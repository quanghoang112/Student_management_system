/*----------------------------------------------------------
MASV:
HO TEN:
LAB: 03
NGAY: 05/04/2023
----------------------------------------------------------*/

-- Cau lenh tao Database
--CREATE DATABASE IF NOT EXISTS `qlsv` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE MASTER
GO 
IF DB_ID('QLSVNhom') IS NOT NULL
	DROP DATABASE QLSVNhom
GO

CREATE DATABASE QLSVNhom
GO
-- Cau lenh chon Table
USE QLSVNhom
GO

CREATE TABLE SINHVIEN (
  MASV NVARCHAR(20) PRIMARY KEY,
  HOTEN NVARCHAR(100) NOT NULL,
  NGAYSINH DATETIME,
  DIACHI NVARCHAR(200),
  MALOP VARCHAR(20),
  TENDN NVARCHAR(100) NOT NULL,
  MATKHAU VARBINARY(2048) NOT NULL
)

-- Tạo bảng NHANVIEN
CREATE TABLE NHANVIEN (
  MANV VARCHAR(20) PRIMARY KEY,
  HOTEN NVARCHAR(100) NOT NULL,
  EMAIL VARCHAR(20),
  LUONG VARBINARY(2048),
  TENDN NVARCHAR(100) NOT NULL,
  MATKHAU VARBINARY(2048) NOT NULL,
  PUBKEY VARCHAR(20) NOT NULL
)

-- Tạo bảng LOP
CREATE TABLE LOP (
  MALOP VARCHAR(20) PRIMARY KEY,
  TENLOP NVARCHAR(100) NOT NULL,
  MANV VARCHAR (20),
  FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
)

-- Tao bang HocPhan
CREATE TABLE HocPhan (
  MaHP VARCHAR(20) PRIMARY KEY,
  TenHP NVARCHAR(100) NOT NULL,
  SoTC INT 
)

-- Tao bang BangDiem
CREATE TABLE BangDiem (
  MaSV NVARCHAR(20),
  MaHP VARCHAR(20),
  DiemThi VARBINARY(2048),
  CONSTRAINT PK_BangDiem PRIMARY KEY (MaSV, MaHP),
  FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MASV),
  FOREIGN KEY (MaHP) REFERENCES HocPhan(MaHP)
)


INSERT INTO NHANVIEN VALUES ('0001', 'Tran Hai Dang', '123@gmail.com', NULL, 'NV1',HASHBYTES('MD5','123'));
INSERT INTO NHANVIEN VALUES ('0002', 'ABC', 'ABC@GMAIL.COM', NULL, 'NV2', HASHBYTES('MD5', '123'));
