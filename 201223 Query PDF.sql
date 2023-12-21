CREATE TABLE PhongBan (
	MaPB VARCHAR (7) PRIMARY KEY,
	TenPB NVARCHAR (50)
);

INSERT INTO PhongBan VALUES (101, 'Phòng Kế Toán');
INSERT INTO PhongBan VALUES (102, 'Phòng Marketing');
INSERT INTO PhongBan VALUES (103, 'Phòng Hành Chính');
INSERT INTO PhongBan VALUES (104, 'Phòng Chăm Sóc Khách Hàng');
INSERT INTO PhongBan VALUES (105, 'Phòng Nhân Sự');

SELECT *
FROM PhongBan;

--------------------------------

CREATE TABLE NhanVien (
	MaNV VARCHAR (7) PRIMARY KEY,
	TenNV NVARCHAR (50),
	NgaySinh DATETIME,
	SoCMND CHAR (9),
	GioiTinh CHAR (1),
	DiaChi NVARCHAR (100),
	NgayVaoLam DATETIME,
	MaPB VARCHAR (7),
	FOREIGN KEY (MaPB) REFERENCES PhongBan (MaPB)
);

INSERT INTO NhanVien VALUES (1, 'Tung', '1995-02-28', 123456789, 'M', '72 Nguyen Trai', '2020-01-18', 105);
INSERT INTO NhanVien VALUES (2, 'Lam', '1997-05-28', 103456743, 'M', '104 Nguyen Trai', '2023-05-25', 102);
INSERT INTO NhanVien VALUES (3, 'Van', '2001-02-14', 457039856, 'F', '280 Vo Chi Cong', '2021-03-13', 103);
INSERT INTO NhanVien VALUES (4, 'Mai', '2006-11-18', 972034567, 'F', '8 Le Thanh tong', '2021-11-21', 104);
INSERT INTO NhanVien VALUES (5, 'Hieu', '1997-08-16', 758940987, 'M', '111 Trung Kinh', '2022-01-11', 101);
INSERT INTO NhanVien VALUES (6, 'Xuan', '1996-04-21', 345790987, 'M', '1 Ta Quang Buu', '2023-01-17', 105);

SELECT *
FROM NhanVien;

---------------------------------------

CREATE TABLE LuongDA (
	MaDA VARCHAR (8),
	MaNV VARCHAR (7),
	NgayNhan DATETIME,
	SoTien Money CHECK (SoTien > 0),
	PRIMARY KEY (MaDA, MaNV),
	FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNV)
);


INSERT INTO LuongDA VALUES (1231, 1, '2020-02-10', 100000);
INSERT INTO LuongDA VALUES (1231, 2, '2021-03-10', 90000);
INSERT INTO LuongDA VALUES (1222, 3, '2020-04-20', 95000);
INSERT INTO LuongDA VALUES (1212, 5, '2021-11-13', 60000);
INSERT INTO LuongDA VALUES (1231, 4, '2021-08-27', 50000);
INSERT INTO LuongDA VALUES (1111, 2, '2022-01-30', 40000);


SELECT *
FROM LuongDA;

--------------------------------------- 2.
SELECT *
FROM PhongBan;

SELECT *
FROM NhanVien;

SELECT *
FROM LuongDA;

---------------------------------------- 3.

SELECT *
FROM NhanVien
WHERE GioiTinh = 'F';

---------------------------------------- 4.

SELECT MaDA
FROM LuongDA;

--------------------------------------- 5.

SELECT MaNV, SUM(SoTien) AS TongLuong
FROM LuongDA
GROUP BY MaNV;

--------------------------------------- 6.

SELECT PhongBan.TenPB, NhanVien.TenNV
FROM PhongBan
LEFT JOIN NhanVien
ON PhongBan.MaPB = NhanVien.MaPB
WHERE PhongBan.MaPB = 103;

--------------------------------------- 7.

SELECT MaNV, TenNV
FROM NhanVien
WHERE MaPB = 103;

SELECT NhanVien.TenNV, LuongDA.SoTien
FROM NhanVien
JOIN LuongDA
ON NhanVien.MaNV = LuongDA.MaNV
WHERE NhanVien.MaPB = 103;

--------------------------------------- 8.

SELECT NhanVien.MaPB, COUNT(NhanVien.MaNV) AS SoLuongNV
FROM NhanVien
GROUP BY NhanVien.MaPB;

--------------------------------------- 9.

SELECT DISTINCT LuongDA.MaNV
FROM LuongDA
WHERE LuongDA.SoTien != 0;

--------------------------------------- 10.

SELECT TOP 1 NhanVien.MaPB, COUNT(NhanVien.MaNV) AS SoLuongNV
FROM NhanVien
GROUP BY NhanVien.MaPB
ORDER BY NhanVien.MaPB DESC;

---------------------------------------- 11.

SELECT COUNT(MaNV) AS SoLuongNV, PhongBan.MaPB, PhongBan.TenPB
FROM NhanVien
INNER JOIN PhongBan
ON NhanVien.MaPB = PhongBan.MaPB
WHERE NhanVien.MaPB = 103
GROUP BY PhongBan.MaPB, PhongBan.TenPB;

--------------------------------------- 12.

DELETE FROM LuongDA 
WHERE MaDA = 1111;

--------------------------------------- 13.

DELETE FROM LuongDA 
WHERE SoTien = 50000;

--------------------------------------- 14.

UPDATE LuongDA
SET SoTien = SoTien * 1.1
WHERE MaDA = 1231;

--------------------------------------- 15.

DELETE FROM NhanVien
WHERE MaNV NOT IN (
	SELECT MaNV
	FROM LuongDA
);
