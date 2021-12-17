USE mahasiswa;

-- Latihan Praktikum VIII dan IX
# Menampilkan nama peserta didik, nama mata pelajaran, dan nilai
# untuk setiap peserta didik yang telah mengambil mata pelajaran
# yang sudah ada nilainya
SELECT mhs.nama, mkuliah.nama_kul, krs.nilai FROM mhs
JOIN krs ON mhs.nim = krs.nim
LEFT JOIN mkuliah ON krs.kode_kul = mkuliah.kode_kul;

# Menampilkan nama peserta didik yang sudah mengambil mata pelajaran 'Bimbingan Karier'
SELECT mhs.nama FROM mhs JOIN krs ON mhs.nim = krs.nim
WHERE krs.kode_kul = 'A21-501 ';

# Menampilkan nama peserta didik yang sudah mengambil mata pelajaran dan nilainya adalah 'A'
SELECT mhs.nama, krs.nilai FROM mhs JOIN krs ON mhs.nim = krs.nim
WHERE nilai BETWEEN 80 AND 100;