CREATE DATABASE IF NOT EXISTS mahasiswa;
USE mahasiswa;
CREATE TABLE mhs (
	nim CHAR(14) NOT NULL,
    nama CHAR(25) NOT NULL,
    alamat VARCHAR(30) NOT NULL,
    kota CHAR(20) NOT NULL,
    sex CHAR(1),
    agama CHAR(1),
    tgl_lhr DATE NOT NULL,
    PRIMARY KEY(nim)
);

INSERT INTO mhs (nim, nama, alamat, kota, sex, agama, tgl_lhr)
	VALUES
		('A21.2001.00234', 'Dedy Sutanta', 'Jl. A. Yani 20', 'Solo', 'P', '1', '1979-10-20'),
        ('A21.2001.00214', 'Budi Satria', 'Jl. Dago 10', 'Yogyakarta', 'P', '1', '1978-11-22'),
        ('A21.2001.00224', 'Sulis', 'Jl. Nakula I 25', 'Semarang', 'W', '2', '1975-08-16'),
        ('A21.2001.00344', 'Suci Andriani', 'Jl. Seroja Raya', 'Semarang', 'W', '3', '1977-09-21');
        
SELECT * FROM mhs;

ALTER TABLE mhs;
INSERT INTO mhs (nim, nama, alamat, kota, sex, agama, tgl_lhr)
	VALUES
		('A12.2001.00001', 'Agus Wahyu', 'Jl. Nakula I No. 5', 'Semarang', 'P', '2', '1976-08-12'),
        ('A11.2001.00002', 'Sari Wijaya', 'Jl. A. Yani 20', 'Solo', 'W', '1', '1977-10-11'),
        ('A22.2001.00003', 'Lestari', 'Jl. Nakula raya 20', 'Semarang', 'W', '3', '1975-11-15');