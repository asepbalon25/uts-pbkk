# 📚 Sistem Basis Data Akademik Kampus

Repositori ini berisi skema dan data awal untuk sistem basis data **Akademik Kampus**. Sistem ini dirancang untuk mengelola informasi mengenai mahasiswa, dosen, mata kuliah, pengampu, serta proses pendaftaran mata kuliah.

## 🗃 Struktur Database

Database ini terdiri dari beberapa tabel utama:

- **`students`**: Menyimpan data mahasiswa.
- **`lecturers`**: Menyimpan data dosen pengajar.
- **`courses`**: Menyimpan data mata kuliah.
- **`course_lecturers`**: Menghubungkan dosen dengan mata kuliah yang mereka ampu.
- **`enrollment`**: Menyimpan informasi mahasiswa yang mengambil mata kuliah tertentu.

## 🧩 Fitur dan Relasi

- Foreign key digunakan untuk menjaga integritas data antar tabel.
- Setiap entitas utama memiliki primary key.
- Tabel relasi (`enrollment` dan `course_lecturers`) digunakan untuk menyimpan banyak-ke-banyak relasi antara mahasiswa-dosen-mata kuliah.
- Data awal (dummy data) sudah disediakan untuk setiap tabel.

## 🛠 Cara Menggunakan

1. **Klon repositori ini**:
   ```bash
https://github.com/Devlineka/database_akademik_kampus/edit/main/README.md
