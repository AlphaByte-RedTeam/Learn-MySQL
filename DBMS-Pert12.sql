CREATE DATABASE IF NOT EXISTS toko_bunga;

USE toko_bunga;

# buat table pegawai
CREATE TABLE pegawai (
    id_pegawai VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_pegawai VARCHAR(50) NOT NULL,
    ttl_pegawai DATE NOT NULL,
    almt_pegwai TEXT NOT NULL,
    hp_pegawai VARCHAR(15) NOT NULL,
    pendidikan_terakhir VARCHAR(10) NOT NULL,
    email varchar(20) NOT NULL
);

CREATE TABLE tingkat_member (
    kode_tingkat VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_tingkat VARCHAR(15) NOT NULL
);

CREATE TABLE pelanggan (
    no_pelanggan VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_pelanggan VARCHAR(20) NOT NULL,
    ttl_pelanggan DATE NOT NULL,
    email_pelanggan VARCHAR(20) NOT NULL,
    hp_pelanggan VARCHAR(15) NOT NULL,
    kode_tingkat VARCHAR(10),
    poin_member INT,
    CONSTRAINT fk_kodetingkat
    FOREIGN KEY(kode_tingkat) REFERENCES tingkat_member(kode_tingkat)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE bunga(
    kd_bunga VARCHAR(10) PRIMARY KEY NOT NULL,
    nama_bunga VARCHAR (20) NOT NULL,
    stok_bunga INT NOT NULL,
    harga_bunga INT NOT NULL
);

CREATE TABLE pesanan(
    no_pesanan VARCHAR(10) PRIMARY KEY NOT NULL,
    no_pelanggan VARCHAR(10),
    kd_bunga VARCHAR(10),
    jumlah_pesanan INT NOT NULL,
    ttl_transaksi DATE NOT NULL,
    CONSTRAINT fk_nopelanggan
    FOREIGN KEY(no_pelanggan) REFERENCES pelanggan(no_pelanggan)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_kdbunga
    FOREIGN KEY(kd_bunga) REFERENCES bunga(kd_bunga)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE transaksi(
    no_transaksi VARCHAR(10) PRIMARY KEY NOT NULL,
    id_pegawai VARCHAR(10),
    no_pesanan VARCHAR(10),
    total_harga INT NOT NULL,
    total_bayar INT,
    kembalian INT,
    status_transaksi VARCHAR(15) NOT NULL,
    CONSTRAINT fk_idpegawai
    FOREIGN KEY(id_pegawai) REFERENCES pegawai(id_pegawai)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_nopesanan
    FOREIGN KEY(no_pesanan) REFERENCES pesanan(no_pesanan)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(no_pesanan) REFERENCES pesanan(no_pesanan)
    ON UPDATE CASCADE ON DELETE CASCADE
);

# menampilkan seluruh table database
SHOW TABLES;

# mengahpus field point member
ALTER TABLE pelanggan
DROP COLUMN poin_member;

# menghapus table tingkat_member
ALTER TABLE pelanggan
DROP FOREIGN KEY fk_kodetingkat;

DROP TABLE tingkat_member;

# menghapus field kode_tingkat
ALTER TABLE pelanggan
DROP COLUMN kode_tingkat;

# mengubah nama field
ALTER TABLE pegawai
RENAME COLUMN email TO email_pegawai;

# menampilkan kolom dalam table
DESC pegawai;

DESC pelanggan;
# menambahkna data dalam table pegawai
INSERT INTO pegawai
    VALUES
        ('pgw-01','pranchis','1993-07-17','jalan mulia budi','081225962554','s1','pranchis@gmail.com'),
        ('pgw-05','agustinus','1992-07-15','jalan syukur indah','081332548126','sma','agus@gmail.com'),
        ('pgw-06','andy','1996-02-14','jalan gendang kenangan','082184563214','s1','andy@gmail.com'),
        ('pgw-08','andhika','1995-03-08','jalan buaran kemang','083158693248','sma','dhika@gmail.com'),
        ('pgw-09','chaterine','1994-09-29','jalan mampang rukun','085236241584','s1','caca@gmail.com');

DESC pelanggan;
# menambahkan data dalam table pelanggan
INSERT INTO pelanggan
    VALUES
        ('mmb-02','dina','1999-06-15','dina@gmail.com','085546214585'),
        ('mmb-06','titus','1996-08-02','titus@gmail.com','08122654785'),
        ('mmb-10','william','1991-10-03','william@gmail.com','08521365487'),
        ('mmb-15','wendy','1998-10-10','wendy@gmail.com','085222335626'),
        ('mmb-30','dela','1999-05-12','dela@gmail.com','081222554485'),
        ('mmb-32','destra','1992-12-20','destra@gmail.com','082114455223');

DESC bunga;
# menambahkan data dalam table bunga
INSERT INTO bunga
    VALUES
        ('bnga-01','melati',10,80000),
        ('bnga-02','krisan',5,100000),
        ('bnga-03','lili',5,85000),
        ('bnga-04','mawar',10,90000),
        ('bnga-05','baby breath',20,50000);

DESC pesanan;
# menambahkan data dalam table pesanan
INSERT INTO pesanan
    VALUES
        ('ordr-01','mmb-32','bnga-02',1,'2021-11-22'),
        ('ordr-02','mmb-15','bnga-05',2,'2021-11-22'),
        ('ordr-03','mmb-30','bnga-01',1,'2021-11-22');

# menambahkan data dalam table transaksi
INSERT INTO transaksi
    VALUES
        ('trnsk-01','pgw-01','ordr-01',100000,100000,null,'selesai'),
        ('trnsk-02','pgw-09','ordr-02',100000,100000,null,'selesai'),
        ('trnsk-03','pgw-05','ordr-03',80000,null,null,'tidak selesai');

# menampilkan seluruh data dalam table pegawai
SELECT * FROM pegawai;

# menampilkan data dari masing-masing table
SELECT * FROM bunga;
SELECT * FROM pegawai;
SELECT * FROM pelanggan;
SELECT * FROM pesanan;
SELECT * FROM transaksi;

INSERT INTO pegawai
    VALUES
        ('pgw-10','druig','1990-10-09','jalan eternal','081221112521','s1','druig@gmail.com'),
        ('pgw-11','makkari','1990-12-02','jalan marvel','085233364851','s1','makkari@gmail.com');

INSERT INTO pelanggan
    VALUES
        ('mmb-33','andreas','1999-04-01','andreas@gmail.com','085255236547'),
        ('mmb-34','marcel','1996-03-02','marcel@gmail.com','081274441255'),
        ('mmb-35','berliana','1999-05-31','berliana@gmail.com','085288845214');

INSERT INTO pesanan
    VALUES
        ('ordr-04','mmb-33','bnga-04',2,'2021-12-1'),
        ('ordr-05','mmb-34','bnga-05',3,'2021-12-1'),
        ('ordr-06','mmb-35','bnga-01',3,'2021-12-1');

INSERT INTO transaksi
    VALUES
        ('trnsk-04','pgw-11','ordr-04','180000','200000','20000','selesai'),
        ('trnsk-05','pgw-11','ordr-05','150000','200000','50000','selesai'),
        ('trnsk-06','pgw-10','ordr-06','240000','240000',null,'selesai');

SELECT * FROM bunga;
# update data bunga
UPDATE bunga
SET stok_bunga = 8
WHERE kd_bunga='bnga-04';

UPDATE bunga
SET stok_bunga = 17
WHERE kd_bunga='bnga-05';

UPDATE bunga
SET stok_bunga = 7
WHERE kd_bunga='bnga-01';

#  penambahan pesanan di esok hari
INSERT INTO pesanan
    VALUES
        ('ordr-07','mmb-15','bnga-03',1,'2021-12-2');

INSERT INTO transaksi
    VALUES
        ('trnsk-07','pgw-06','ordr-06','85000',null,null,'tidak selesai');

INSERT INTO pesanan
    VALUES
        ('ordr-08','mmb-15','bnga-02',2,'2021-12-2');

INSERT INTO transaksi
    VALUES
        ('trnsk-08','pgw-06','ordr-07','200000','200000',null,'selesai');

UPDATE bunga
SET stok_bunga = 3
WHERE kd_bunga='bnga-02';

# menghapus data dalam table transaksi yang statusnya 'tidak selesai'
DELETE FROM transaksi WHERE status_transaksi = 'tidak selesai';

SELECT * FROM transaksi;

INSERT INTO pesanan
    VALUES
        ('ordr-09','mmb-33','bnga-04',2,'2021-12-1');

INSERT INTO transaksi
    VALUES
        ('trnsk-09','pgw-01','ordr-09','180000','180000',null,'selesai');

UPDATE bunga
SET stok_bunga = 6
WHERE kd_bunga='bnga-04';

# cek pegawai berurutan a-z
SELECT * FROM pegawai
ORDER BY nama_pegawai ASC;

# pengelompokkan
SELECT jumlah_pesanan, ttl_transaksi FROM pesanan
GROUP BY ttl_transaksi;

SELECT nama_bunga, stok_bunga FROM bunga;
# having -> menampilkan stok_bunga yang lebih dari 3
SELECT nama_bunga, stok_bunga FROM bunga
GROUP BY stok_bunga
HAVING stok_bunga > 3;

SELECT * FROM pegawai;
# operator like
SELECT * FROM pegawai
WHERE nama_pegawai like '%an%';

# 'an%' -> menampilkan nama yang mengandung huruf 'an' di paling depan
# '%an' -> menampilkan nama yang mengandung huruf 'an' di paling belakang

SELECT * FROM transaksi;
# tampilkan lebih dari 1 kondisi
# Statement IN berarti menampilkan data yang sama sesuai kondisi
SELECT * FROM transaksi WHERE total_bayar IN(100000, 200000);

# menggunakan between
# Statement BETWEEN berarti menampilkan range data dari 100000 sampai 200000
SELECT * FROM transaksi WHERE total_bayar BETWEEN 100000 AND 200000;

# inner join
# no pesanan, nama pelanggan, nama bunga
# SELECT namaCol1, ... FROM TABLE a JOIN TABLE b IN tableA.column fk = tableB.column pk
SELECT pesanan.no_pesanan, pelanggan.nama_pelanggan, bunga.nama_bunga FROM pesanan
    INNER JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan
    INNER JOIN bunga ON pesanan.kd_bunga = bunga.kd_bunga;

SELECT pesanan.no_pesanan, pelanggan.nama_pelanggan, bunga.nama_bunga FROM pesanan, pelanggan, bunga
    WHERE pesanan.no_pelanggan = pelanggan.no_pelanggan AND pesanan.kd_bunga = bunga.kd_bunga;

# join beberapa table
SELECT transaksi.no_transaksi, pegawai.nama_pegawai, pesanan.no_pesanan, pelanggan.nama_pelanggan, bunga.nama_bunga FROM transaksi
    JOIN pegawai ON transaksi.id_pegawai = pegawai.id_pegawai
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan
    JOIN bunga ON pesanan.kd_bunga = bunga.kd_bunga;

INSERT INTO pegawai VALUES ('pgw-12', 'bambang', '1990-10-09', 'jalan eternal', '081221112521', 'drui@gmail.com');

# inner join
SELECT pelanggan.nama_pelanggan, transaksi.no_transaksi FROM transaksi
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    INNER JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan;

# left join
SELECT pelanggan.nama_pelanggan, transaksi.no_transaksi FROM transaksi
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    INNER JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan;

# right join
SELECT pelanggan.nama_pelanggan, transaksi.no_transaksi FROM transaksi
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    RIGHT JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan;

# union
SELECT id_pegawai FROM pegawai
UNION
SELECT total_harga FROM transaksi
UNION
SELECT no_pesanan FROM pesanan
UNION
SELECT nama_pelanggan FROM pelanggan;

# union all
SELECT id_pegawai, nama_pegawai AS nama FROM pegawai
UNION ALL
SELECT no_pelanggan nama_pelanggan FROM pelanggan;

# operator like
SELECT * FROM pegawai
WHERE nama_pegawai LIKE '%an%';

SELECT transaksi.no_transaksi, pegawai.nama_pegawai, pesanan.no_pesanan, pelanggan.nama_pelanggan, bunga.nama_bunga FROM transaksi
    JOIN pegawai ON transaksi.id_pegawai = pegawai.id_pegawai
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan
    JOIN bunga ON pesanan.kd_bunga = bunga.kd_bunga
WHERE pegawai.nama_pegawai NOT LIKE 'baby%';

# ganjil genap
# ini genap
SELECT * FROM transaksi;
SELECT transaksi.no_transaksi, pegawai.nama_pegawai, pesanan.no_pesanan, pelanggan.nama_pelanggan, bunga.nama_bunga FROM transaksi
    JOIN pegawai ON transaksi.id_pegawai = pegawai.id_pegawai
    JOIN pesanan ON transaksi.no_pesanan = pesanan.no_pesanan
    JOIN pelanggan ON pesanan.no_pelanggan = pelanggan.no_pelanggan
    JOIN bunga ON pesanan.kd_bunga = bunga.kd_bunga
WHERE MOD(SUBSTRING(transaksi.no_transaksi, 7), 2) = 0;

# ini ganjil
DESC pegawai;
SELECT * FROM pegawai;
# YYYY MM DD

SELECT * FROM pegawai WHERE MOD(date_format(ttl_pegawai, '%Y'), 2) = 1;

# tampilkan vokal / bukan vokal
# tampilkan nama pegawai yang diakhiri bukan dengan huruf vokal
SELECT * FROM pegawai WHERE SUBSTRING(nama_pegawai, -1) NOT IN('A', 'I', 'U', 'E', 'O');

# tampilkan nama pegawai yang huruf ke 2 adalah huruf vokal
SELECT * FROM pegawai WHERE SUBSTRING(nama_pegawai, 2, 1) IN('A', 'I', 'U', 'E', 'O');

# atau
# NOT RECOMMENDED
SELECT * FROM pegawai WHERE nama_pegawai NOT LIKE '%a' OR '%i' OR '%u' OR '%e' OR '%o';
SELECT * FROM pegawai WHERE nama_pegawai LIKE '_a%' OR '_i%' OR '_u%' OR '_e%' OR '_o%';

# rata-rata subquery tunggal
SELECT * FROM bunga;
# tampilkan data bunga yang harga bunganya dibawah nilai max harga bunga dari rata-rata bunga
SELECT * FROM bunga WHERE harga_bunga < (SELECT MAX(harga_bunga) FROM bunga WHERE harga_bunga < 90000);

SELECT MAX(harga_bunga) FROM bunga;
SELECT AVG(harga_bunga) FROM bunga;
SELECT MAX(harga_bunga) FROM bunga WHERE harga_bunga < (SELECT AVG(harga_bunga) FROM bunga);

# subquery ganda
SELECT * FROM transaksi;
SELECT MAX(total_harga) FROM transaksi;
SELECT AVG(total_bayar) FROM transaksi;

SELECT * FROM transaksi
WHERE total_harga = (SELECT MAX(total_harga) FROM transaksi WHERE total_harga > (SELECT AVG(total_bayar) FROM transaksi));

SELECT * FROM transaksi
WHERE total_bayar < (SELECT AVG(total_bayar) FROM transaksi WHERE total_harga = (SELECT MAX(total_harga) FROM transaksi));

SELECT AVG(total_bayar) FROM transaksi WHERE total_harga = (SELECT MAX(total_harga) FROM transaksi);

# operator IN = memunculkan data pasti sesuai yang diminta
SELECT * FROM transaksi WHERE total_bayar IN(100000, 200000);

# operator BETWEEN = memunculkan data antara kondisi yang diminta
SELECT * FROM transaksi WHERE total_bayar BETWEEN 100000 AND 200000;
