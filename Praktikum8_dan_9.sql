USE mahasiswa;

-- Latihan Praktikum VIII dan IX
# Menampilkan nama peserta didik, nama mata pelajaran, dan nilai
# untuk setiap peserta didik yang telah mengambil mata pelajaran
# yang sudah ada nilainya
# TODO
SELECT nama, nama_kul, nilai FROM mhs, mkuliah, krs WHERE nilai;

# Menampilkan nama peserta didik yang sudah mengambil mata pelajaran 'Bimbingan Karier'