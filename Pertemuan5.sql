USE mahasiswa;

# Buat table mkuliah pada database yang sudah ada
CREATE TABLE mkuliah (
    kode_kul CHAR(7) PRIMARY KEY UNIQUE NOT NULL,
    nama_kul CHAR(20) NOT NULL,
    sks DECIMAL(2) NOT NULL,
    smt_tawar CHAR(1),
    klp_kul CHAR(1) DEFAULT '1',
    progdi CHAR(1)
);

# Mengisi data ke dalam table mkuliah
INSERT INTO mkuliah (kode_kul, nama_kul, sks, smt_tawar, klp_kul, progdi)
    VALUES
        ('A21-101', 'Pancasila', '2', '1', '1', '1'),
        ('A21-102', 'Logika Algoritma', '4', '1', '2', '1'),
        ('A21-103', 'Pemrograman Basic', '2', '1', '2', '1'),
        ('A21-201', 'Sistem Basis Data I', '2', '2', '2', '1'),
        ('A21-202', 'Pemrograman Pascal', '4', '2', '2', '1'),
        ('A21-203', 'Ilmu Sosial Dasar', '2', '2', '1', '1'),
        ('A21-501', 'Bimbingan Karier', '2', '5', '3', '1'),
        ('A21-601', 'Proyek Akhir', '4', '6', '3', '1');

# Menampilkan seluruh data dari table mkuliah
SELECT * FROM mkuliah;

# Menampilkan nama mata pelajaran yang sksnya 2 dan ditawarkan di semester 6
SELECT nama_kul FROM mkuliah WHERE sks = '2' AND smt_tawar = '6';

# Menampilkan nama mata pelajaran yang sksnya lebih besar dari 2 sks
SELECT nama_kul FROM mkuliah WHERE sks > '2';

# Menampilkan nama mata pelajaran yang huruf depannya dimulai dengan P
SELECT nama_kul FROM mkuliah WHERE mkuliah.nama_kul LIKE 'P%';

# Mengganti nama mata pelajaran Pancasila menjadi Pendidikan Pancasila
UPDATE mkuliah
SET nama_kul = 'Pendidikan Pancasila'
WHERE nama_kul = 'Pancasila';

# Mengganti nama mata pelajaran Pemrograman Basic menjadi Pemrograman (Basic)
UPDATE mkuliah
SET nama_kul = 'Pemrograman (Basic)'
WHERE nama_kul = 'Pemrograman Basic';

# Menambahkan record baru
INSERT INTO mkuliah (kode_kul, nama_kul, sks, smt_tawar, klp_kul, progdi)
    VALUES
        ('A12-202', 'Pemrograman Pascal', '4', '2', '2', '2'),
        ('A22-203', 'Kewiraan', '2', '2', '1', '2'),
        ('A11-501', 'Bimbingan Karier', '2', '5', '3', '2'),
        ('A12-601', 'Tugas Akhir', '6', '6', '3', '2');

# Mengganti nama mata pelajaran Kewiraan menjadi Pendidikan Kewarganegaraan
UPDATE mkuliah
SET nama_kul = 'Pendidikan Kewarganegaraan'
WHERE nama_kul = 'Kewiraan';

# Menghitung seluruh data yang telah tersimpan pada tabel mkuliah tersebut
SELECT COUNT(*) FROM mkuliah;

# Menampilkan nama mata pelajaran dan sks yang telah diurutkan berdasarkan kunci nama mata pelajaran secara ascending
SELECT nama_kul, sks FROM mkuliah ORDER BY kode_kul ASC;

# Menampilkan nama mata pelajaran, sks, semester tawar dan program studi yang telah diurutkan berdasarkan field kunci semester tawar dengan urutan ascending dan field kunci program studi dengan urutan descending
SELECT nama_kul, sks, smt_tawar, progdi FROM mkuliah ORDER BY smt_tawar ASC, progdi DESC;

# Mengelompokkan data mata pelajaran berdasarkan kelompok mata pelajaran
SELECT nama_kul FROM mkuliah GROUP BY nama_kul;

# Menampilkan kelompok mata pelajaran dan hitung jumlah sks berdasarkan kelompok mata pelajaran
SELECT klp_kul, SUM(sks) FROM mkuliah WHERE klp_kul;

# Menampilkan kode program studi dan hitung jumlah sks berdasarkan kelompok program studi
SELECT progdi, SUM(sks) FROM mkuliah WHERE progdi GROUP BY progdi;

# Menampilkan jumlah sks terkecil untuk program studi MI-D3
SELECT MIN(sks) FROM mkuliah WHERE progdi = '1';

# Menampilkan jumlah sks terbesar untuk program studi MI-D3
SELECT MAX(sks) FROM mkuliah WHERE progdi = '1';

# Menampilkan jumlah sks terkecil untuk program studi SI-SI
SELECT MIN(sks) FROM mkuliah WHERE progdi = '2';

# Menampilkan sks rata-rata untuk mata pelajaran kelompok MPK
SELECT AVG(sks) FROM mkuliah WHERE klp_kul = '1';

# Mneampilkan sks rata-rata untuk mata pelajaran kelompok MKB
SELECT AVG(sks) FROM mkuliah WHERE klp_kul = '3';

# Menghitung jumlah sks untuk mata pelajaran kelompok MPK
SELECT SUM(sks) FROM mkuliah WHERE klp_kul = '1';

# Menghitung jumlah sks untuk mata pelajaran kelompok MKK
SELECT SUM(sks) FROM mkuliah WHERE  klp_kul = '2';

# Menghitung jumlah mata pelajaran yang termasuk dalam kelompok MPK
SELECT COUNT(nama_kul) FROM mkuliah WHERE klp_kul = '1';