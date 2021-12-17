USE mahasiswa;

# Buat table bernama dosen
CREATE TABLE IF NOT EXISTS dosen (
    kode_dos INT UNSIGNED KEY UNIQUE NOT NULL AUTO_INCREMENT,
    nama_dos VARCHAR(30),
    alamat_dos VARCHAR(50),
    tgl_masuk DATE NOT NULL
);

# Menambahkan field kota_dos setelah field alamat_dos
ALTER TABLE dosen
ADD COLUMN kota_dos CHAR(20) AFTER alamat_dos;

# Mengisi record-record ke table dosen
INSERT INTO dosen (kode_dos, nama_dos, alamat_dos, kota_dos, tgl_masuk)
    VALUES
        (1, 'Arief Budiman, Ir.', 'Jl. A. Yani 20', 'Semarang', '1990-02-19'),
        (2, 'Husni, Prof.', 'Jl. Merdeka Raya', 'Semarang', '1988-10-13'),
        (3, 'Candawati, Dra.', 'Perum Korpri I', 'Solo', '1994-09-20'),
        (4, 'Irawan S., DR.', 'Jl. Kemuning Barat 11', 'Semarang', '1992-04-15'),
        (5, 'Sumiati, SE., M.SI.', 'Jl. Seroja Indah 100', 'Kudus', '1995-08-11');

# Mengedit data alamat, kota, dan tanggal masuk dosen yang bernama Candawati, Dra.
/*
alamat_dos = Perum Pondok Indah C-10
kota_dos = Semarang
tgl_masuk = 21-09-1994
*/
UPDATE dosen
SET
    alamat_dos = 'Perum Pondok Indah C-10',
    kota_dos = 'Semarang',
    tgl_masuk = '1994-09-21'
WHERE nama_dos = 'Candawati, Dra.';

# Menampilkan nama_dos, kota_dos, dan lama_kerja seluruh dosen
SELECT nama_dos, kota_dos, TO_DAYS(CURDATE()) - TO_DAYS(tgl_masuk) AS lama_kerja_hari FROM dosen;

# Membuat table krs
CREATE TABLE IF NOT EXISTS krs (
    kode_kul CHAR(7) NOT NULL,
    nim CHAR(14) NOT NULL,
    kode_dos INT(4) NOT NULL,
    nilai TINYINT NOT NULL
);

INSERT INTO krs (kode_kul, nim, kode_dos, nilai)
    VALUES
        ('A21-101', 'A21.2001.00234', 2, 80),
        ('A21-201', 'A21.2001.00214', 4, 75),
        ('A21-201', 'A21.2001.00234', 1, 89),
        ('A21-601', 'A21.2001.00214', 3, 90),
        ('A21-501', 'A21.2001.00214', 5, 85),
        ('A21-501', 'A21.2001.00234', 5, 77),
        ('A21-101', 'A21.2001.00224', 2, 95);

# Menampilkan data nilai dan nilai_huruf dari table krs
SELECT kode_kul,
       nim,
       kode_dos,
       nilai,
CASE
    WHEN nilai BETWEEN 86 AND 100 THEN 'A'
    WHEN nilai BETWEEN 71 AND 85 THEN 'B'
    WHEN nilai BETWEEN 56 AND 70 THEN 'C'
    WHEN nilai BETWEEN 41 AND 55 THEN 'D'
    WHEN nilai BETWEEN 0 AND 40 THEN 'E'
END AS nilai_huruf
FROM krs;
