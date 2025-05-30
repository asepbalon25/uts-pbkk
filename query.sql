/*
🟢 1. SELECT (Pengambilan Data)
a. Menampilkan semua mahasiswa:
*/
SELECT * FROM students;

--b. Menampilkan daftar mata kuliah semester ganjil:
SELECT * FROM courses WHERE semester = 'Ganjil';

--c. Menampilkan dosen pengampu utama:
SELECT name FROM lecturers
WHERE lecturer_id IN (
  SELECT lecturer_id FROM course_lecturers WHERE role = 'Pengampu Utama'
);

--d. Menampilkan mahasiswa yang mengambil mata kuliah "Kecerdasan Buatan":
SELECT s.name AS nama_mahasiswa, c.name AS mata_kuliah
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.name = 'Kecerdasan Buatan';

/*
🟡 2. INSERT (Menambahkan Data)
a. Menambahkan mahasiswa baru:
*/
INSERT INTO students (student_id, name, email, NIM, major, enrollment_year)
VALUES ('ST011', 'Kurniawan Saputra', 'kurniawan@email.com', 'NIM011', 'Teknik Sipil', '2024-08-19');

--b. Menambahkan mata kuliah baru:
INSERT INTO courses (course_id, name, code, credits, semester)
VALUES ('CS011', 'Pemrograman Mobile', 'MOBILE', '3', 'Genap');

/*
🔵 3. UPDATE (Memperbarui Data)
a. Mengubah email mahasiswa:
*/
UPDATE students
SET email = 'dadangbaru@email.com'
WHERE student_id = 'ST001';

--b. Mengubah status pendaftaran mata kuliah:
UPDATE enrollment
SET status = 'Lulus'
WHERE enrollment_id = 'ENR001';

/*
🔴 4. DELETE (Menghapus Data)
a. Menghapus mahasiswa berdasarkan ID:
*/
DELETE FROM students WHERE student_id = 'ST011';

--b. Menghapus dosen dari tabel lecturers:
DELETE FROM lecturers WHERE lecturer_id = 'LC010';

/*
🧩 5. JOIN (Menggabungkan Tabel)
a. Mahasiswa beserta mata kuliah yang diambil:
*/
SELECT s.name AS mahasiswa, c.name AS mata_kuliah, e.attendance, e.status
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

--b. Daftar dosen dan mata kuliah yang diajar:
SELECT l.name AS dosen, c.name AS mata_kuliah, cl.role
FROM course_lecturers cl
JOIN lecturers l ON cl.lecturer_id = l.lecturer_id
JOIN courses c ON cl.course_id = c.course_id;

/*
Query Gabungan dengan Filter
a. Menampilkan mahasiswa dari jurusan “Informatika” yang mengikuti kuliah semester “Ganjil”:
*/
SELECT s.name, c.name AS mata_kuliah, c.semester
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.major = 'Informatika' AND c.semester = 'Ganjil';


