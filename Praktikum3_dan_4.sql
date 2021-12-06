CREATE DATABASE IF NOT EXISTS mahasiswa;
USE mahasiswa;
CREATE TABLE mhs (
	nim CHAR(14) PRIMARY KEY UNIQUE NOT NULL,
    nama CHAR(25) NOT NULL,
    alamat VARCHAR(30) NOT NULL,
    kota CHAR(20) NOT NULL,
    sex CHAR(1),
    agama CHAR(1) DEFAULT '1',
    tgl_lhr DATE NOT NULL
);

INSERT INTO mhs (nim, nama, alamat, kota, sex, agama, tgl_lhr)
	VALUES
		('A21.2001.00234', 'Dedy Sutanta', 'Jl. A. Yani 20', 'Solo', 'P', '1', '1979-10-20'),
        ('A21.2001.00214', 'Budi Satria', 'Jl. Dago 10', 'Yogyakarta', 'P', '1', '1978-11-22'),
        ('A21.2001.00224', 'Sulis', 'Jl. Nakula I 25', 'Semarang', 'W', '2', '1975-08-16'),
        ('A21.2001.00344', 'Suci Andriani', 'Jl. Seroja Raya', 'Semarang', 'W', '3', '1977-09-21');
        
SELECT * FROM mhs;

# Menambahkan record baru ke table mhs
INSERT INTO mhs (nim, nama, alamat, kota, sex, agama, tgl_lhr)
	VALUES
		('A12.2001.00001', 'Agus Wahyu', 'Jl. Nakula I No. 5', 'Semarang', 'P', '2', '1976-08-12'),
        ('A11.2001.00002', 'Sari Wijaya', 'Jl. A. Yani 20', 'Solo', 'W', '1', '1977-10-11'),
        ('A22.2001.00003', 'Lestari', 'Jl. Nakula raya 20', 'Semarang', 'W', '3', '1975-11-15');

# Menampilkan seluruh field dan record peserta didik
SELECT * FROM mhs;

# Menampilkan nama peserta didik yang sex='P'
SELECT mhs.nama FROM mhs WHERE mhs.sex='P';

# Menampilkan nama dan alamat peserta didik yang nim antara A21.2001.00001 s.d A21.2001.001000
SELECT mhs.nama, mhs.alamat FROM mhs WHERE mhs.nim BETWEEN 'A21.2001.00001' AND 'A11.2001.00100';

# Menampilkan nama peserta didik yang nama depannya adalah Sari
SELECT mhs.nama FROM mhs WHERE mhs.nama LIKE 'Sari%';

# Menampilkan nama dan alamat peserta didik yang namanya mengandung huruf 'a' atau huruf 'i'
SELECT mhs.nama, mhs.alamat FROM mhs WHERE mhs.nama LIKE 'a%' OR 'i%';

# Menampilkan nama, alamat, dan kota peserta didik yang kota asalnya Semarang atau Solo
SELECT mhs.nama, mhs.alamat, mhs.kota FROM mhs WHERE kota='Solo' OR kota='Semarang';

# Menampilkan nim, nama, dan alamat peserta didik yang sex nya selain W
SELECT mhs.nim, mhs.nama, mhs.alamat FROM mhs WHERE sex != 'W';

# Mengganti nama peserta didik yang NIM nya 'A21.2001.00003' menjadi 'Lestari Handayani'
UPDATE mhs
SET mhs.nama = 'Lestari Handayani'
WHERE mhs.nim = 'A21.2001.00003';

# Mengganti alamat dan tanggal lahir peserta didik yang NIM nya 'A21.2001.000002' menjadi 'Sari Wijayanti', '1977-10-17'
UPDATE mhs
SET mhs.alamat = 'Sari Wijayanti', mhs.tgl_lhr = '1977-10-17'
WHERE mhs.nim = 'A21.2001.000002';

# Menghapus record peserta didik yang sex = P atau agama = 3
DELETE FROM mhs WHERE mhs.sex = 'P' OR mhs.agama='3';

# Menghapus record-record peserta didik yang NIM nya antara A21.2001.001000 s.d A21.2001.00300
DELETE FROM mhs WHERE mhs.nim BETWEEN 'A21.2001.00100' AND 'A21.2001.00300';