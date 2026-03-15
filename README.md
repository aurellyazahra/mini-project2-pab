# MINI PROJECT PAB

NAMA: ZAHRA AURELLYA HERDIANSYAH

KELAS: SI B 2024

NIM: 2409116062

# DESKRIPSI APLIKASI
Aplikasi Manajemen Buku Perpustakaan merupakan aplikasi mobile berbasis Flutter yang digunakan untuk menampilkan daftar buku, melihat detail buku, serta melakukan pengelolaan data buku secara sederhana. Pengguna dapat melihat informasi buku seperti judul, penulis, gambar, dan deskripsi. Selain itu, aplikasi menyediakan fitur peminjaman dan pengembalian buku untuk mensimulasikan sistem perpustakaan digital. Aplikasi ini dirancang dengan antarmuka sederhana dan interaktif sehingga mudah digunakan oleh pengguna dalam melakukan pengelolaan data buku.

# FITUR APLIKASI

## Registrasi
![regis](assets/screenshots/Screenshot%202026-03-16%20012344.png)

Fitur ini digunakan untuk menambahkan akun dengan cara menginput email dan password yang nantinya akan langsung tersimpan dalam supabase.

## Login

Fitur ini bagi yang sudah memiliki akun atau sudah registrasi sebelumnya, untuk nantinya akan masuk ke dalam homepage (menampilkan daftar buku)

## Menampilkan Daftar Buku (Homepage)
<img width="747" height="828" alt="image" src="https://github.com/user-attachments/assets/7b37e079-d0c0-4353-a177-a954a161cfc4" />

Fitur ini berfungsi untuk menampilkan seluruh data buku yang tersimpan di dalam aplikasi pada halaman utama (homepage). Buku ditampilkan dalam bentuk card sehingga informasi dapat dilihat secara ringkas namun tetap jelas. Setiap card berisi gambar buku, judul, serta elemen visual yang memudahkan pengguna mengenali buku dengan cepat. Pengguna dapat menekan salah satu card untuk membuka halaman detail buku. Tampilan daftar ini membantu pengguna melihat koleksi buku secara keseluruhan dengan navigasi yang sederhana dan responsi

## Melihat detail buku
<img width="737" height="697" alt="image" src="https://github.com/user-attachments/assets/817d53c5-1441-46e9-bd67-dfd96661417a" />

Fitur detail buku memungkinkan pengguna melihat informasi lengkap dari buku yang dipilih. Pada halaman ini ditampilkan gambar buku dengan ukuran lebih besar, judul buku, nama penulis, serta deskripsi buku secara lengkap. Halaman detail dirancang agar informasi mudah dibaca dan tersusun rapi. Selain menampilkan informasi, halaman ini juga menjadi pusat aksi utama karena pengguna dapat melakukan peminjaman, pengembalian, maupun pengeditan data buku dari satu halaman yang sama.

## Menambahkan buku
<img width="733" height="655" alt="image" src="https://github.com/user-attachments/assets/c3a5ac46-f979-459d-82a5-123ac8498959" />

<img width="118" height="118" alt="image" src="https://github.com/user-attachments/assets/3f44af38-df6c-43e9-924a-630df7188005" />

Fitur tambah buku digunakan untuk memasukkan data buku baru ke dalam aplikasi. Pengguna mengisi form yang terdiri dari judul buku, nama penulis, deskripsi, dan link gambar buku. Sistem validasi diterapkan agar semua data wajib diisi sebelum disimpan, sehingga data yang masuk tetap lengkap dan konsisten. Setelah tombol simpan ditekan, buku baru akan langsung muncul pada halaman utama tanpa perlu memuat ulang aplikasi.

## Mengedit data buku
<img width="732" height="639" alt="image" src="https://github.com/user-attachments/assets/40bed18e-90d3-4bb4-a236-13740ce1a1f5" />

<img width="720" height="54" alt="image" src="https://github.com/user-attachments/assets/bd117ab6-3b7b-47a3-8135-40e7d6388d5b" />

Fitur edit buku memungkinkan pengguna memperbarui informasi buku yang sudah ada. Saat pengguna memilih tombol edit, aplikasi akan membuka halaman form yang sama seperti tambah buku, namun data sebelumnya akan otomatis terisi pada setiap field. Hal ini memudahkan pengguna karena hanya perlu mengubah bagian yang diperlukan saja. Setelah perubahan disimpan, data buku akan diperbarui dan langsung terlihat pada halaman utama aplikasi.

## Menghapus buku
<img width="637" height="288" alt="image" src="https://github.com/user-attachments/assets/44c07741-0941-4291-81a4-f47c5bdade28" />

<img width="32" height="34" alt="image" src="https://github.com/user-attachments/assets/15e2a670-ceea-446a-a697-b2e974595d0a" />

Fitur hapus buku digunakan untuk menghilangkan data buku dari daftar koleksi. Proses penghapusan dilakukan melalui ikon delete yang tersedia pada widget buku sehingga pengguna dapat menghapus data dengan cepat tanpa membuka halaman lain. Fitur ini membantu pengguna dalam mengelola koleksi buku agar tetap relevan dan tidak menampilkan data yang sudah tidak diperlukan.

## Peminjaman buku
<img width="739" height="405" alt="image" src="https://github.com/user-attachments/assets/9b249c85-4aaf-4502-8b52-c4702a19bf1a" />

<img width="594" height="33" alt="image" src="https://github.com/user-attachments/assets/2a9bbf8b-2d10-4285-bbc5-facac51dadd2" />

Fitur peminjaman memungkinkan pengguna meminjam buku yang masih tersedia. Ketika tombol “Pinjam Buku” ditekan, status buku akan berubah menjadi sedang dipinjam. Sistem kemudian memberikan notifikasi berupa SnackBar sebagai tanda bahwa proses peminjaman berhasil dilakukan. Perubahan status ini juga memengaruhi tampilan tombol sehingga pengguna mengetahui kondisi buku secara langsung.

## Pengembalian Buku
<img width="617" height="41" alt="image" src="https://github.com/user-attachments/assets/ffb259aa-135e-485a-8a94-e539b61d9fbf" />

<img width="299" height="66" alt="image" src="https://github.com/user-attachments/assets/89f463d1-fb64-471b-84e1-65d3e6ace7cc" />

Fitur pengembalian buku merupakan kebalikan dari fitur peminjaman. Jika buku sedang dipinjam, tombol aksi akan berubah menjadi “Kembalikan Buku”. Setelah ditekan, status buku akan kembali menjadi tersedia dan notifikasi keberhasilan akan ditampilkan kepada pengguna. Fitur ini mensimulasikan alur dasar sistem perpustakaan digital secara sederhana.

## Navigasi antar halaman
### detail buku
<img width="740" height="788" alt="image" src="https://github.com/user-attachments/assets/4457394f-6abb-41dd-b5fd-2313f9ec0444" />

### pinjam buku
<img width="729" height="398" alt="image" src="https://github.com/user-attachments/assets/676d2a78-0dea-40c3-b974-9d97eda9658f" />

### edit buku
<img width="731" height="642" alt="image" src="https://github.com/user-attachments/assets/af3653f2-980b-4a1b-8cf8-dbb4991ef45b" />

### tambah buku
<img width="725" height="658" alt="image" src="https://github.com/user-attachments/assets/cfb45ef6-cbef-404d-94d4-0e463fac9c8b" />

Aplikasi menggunakan sistem navigasi Flutter Navigator untuk berpindah antar halaman, seperti dari homepage ke detail buku, halaman tambah buku, maupun halaman edit buku. Navigasi ini memungkinkan pertukaran data antar halaman sehingga perubahan data dapat langsung diperbarui tanpa perlu memulai ulang aplikasi.

## Fitur Tambahan
### Light mode

Fitur ini berfungsi untuk menampilkan aplikasi dalam mode terang.

### Dark mode

Fitur ini berfungsi untuk menampilkan aplikasi dalam mode gelap.

### Logout

Fitur ini digunakan untuk keluar dari homepage, dan akan kembali ke halaman login.

# WIDGET

## 1. STRUKTUR LAYOUT
### Scaffold
Scaffold merupakan widget dasar yang digunakan sebagai struktur utama setiap halaman aplikasi. Widget ini menyediakan kerangka standar seperti AppBar, body, dan FloatingActionButton, sehingga memudahkan pengelolaan tata letak halaman secara konsisten.

### AppBar
AppBar digunakan sebagai bagian header aplikasi yang menampilkan judul halaman serta navigasi utama. Pada aplikasi ini, AppBar berfungsi sebagai navigasi sederhana menuju menu Beranda, Buku, dan Profil.

### Column
Column digunakan untuk menyusun beberapa widget secara vertikal dari atas ke bawah. Widget ini banyak digunakan untuk menata elemen seperti gambar buku, judul, deskripsi, dan tombol aksi dalam satu halaman.

### Row
Row berfungsi untuk menyusun widget secara horizontal. Pada aplikasi ini digunakan untuk mengatur posisi teks navigasi dan beberapa elemen UI agar sejajar secara mendatar.

### Container
Container merupakan widget pembungkus yang digunakan untuk memberikan styling tambahan seperti warna latar belakang, ukuran, border radius, serta bayangan (shadow). Container membantu membuat tampilan kartu buku menjadi lebih rapi dan menarik.

### Padding
Padding digunakan untuk memberikan jarak di dalam suatu widget agar tampilan tidak terlalu rapat. Widget ini membantu meningkatkan keterbacaan dan kenyamanan tampilan antarmuka.

### SizedBox
SizedBox digunakan untuk memberikan jarak kosong antar widget baik secara vertikal maupun horizontal. Selain itu, widget ini juga dapat mengatur tinggi atau lebar tertentu pada suatu komponen.

## 2. TAMPILAN DATA
### Text
Text digunakan untuk menampilkan informasi berbentuk tulisan seperti judul buku, nama penulis, deskripsi buku, serta status ketersediaan buku.

### Image.network

Image.network digunakan untuk menampilkan gambar buku yang berasal dari URL internet. Widget ini memungkinkan pengguna menambahkan buku dengan gambar online tanpa perlu menyimpan aset secara lokal.

### Image.asset
Image.asset digunakan untuk menampilkan gambar yang tersimpan di dalam folder aset aplikasi. Widget ini digunakan pada buku bawaan aplikasi agar tetap dapat ditampilkan secara offline.

### Card
Card digunakan untuk menampilkan data buku dalam bentuk kartu dengan tampilan yang lebih modern. Widget ini membantu memberikan efek elevasi dan pemisahan visual antar item buku.

### Icon
Icon digunakan untuk menampilkan simbol visual seperti ikon profil, ikon hapus, dan ikon aksi lainnya agar pengguna lebih mudah memahami fungsi tombol.

## 3. INTERAKSI PENGGUNA
### ElevatedButton
ElevatedButton digunakan sebagai tombol utama untuk menjalankan aksi penting seperti meminjam buku, mengembalikan buku, menyimpan data buku, dan mengedit buku. Tombol ini memiliki tampilan menonjol sehingga mudah dikenali pengguna.

### IconButton
IconButton merupakan tombol berbasis ikon yang digunakan untuk aksi cepat seperti menghapus atau mengedit data buku. Widget ini membantu menjaga tampilan tetap minimalis.

### SnackBar
SnackBar digunakan untuk memberikan notifikasi sementara kepada pengguna setelah suatu aksi berhasil dilakukan, seperti menambahkan, menghapus, meminjam, atau mengembalikan buku.

### GestureDetector / InkWell

Widget ini digunakan untuk mendeteksi interaksi sentuhan pada item buku. Ketika pengguna menekan kartu buku, aplikasi akan membuka halaman detail buku.

## 4. NAVIGASI
### Navigator.push()
Navigator.push() digunakan untuk berpindah dari satu halaman ke halaman lain, misalnya dari halaman beranda menuju halaman detail buku atau halaman tambah buku.

### Navigator.pop()
Navigator.pop() digunakan untuk kembali ke halaman sebelumnya sekaligus mengirim data hasil aksi, seperti data buku baru atau hasil edit buku.

## 5. FORM INPUT
### TextField
TextField digunakan untuk menerima input teks sederhana dari pengguna.

### TextFormField
TextFormField merupakan versi lanjutan dari TextField yang mendukung validasi input. Widget ini digunakan untuk memastikan data buku tidak kosong sebelum disimpan.

### Form
Form digunakan sebagai pembungkus beberapa field input agar proses validasi data dapat dilakukan secara bersamaan sebelum data dikirim.

### TextEditingController
TextEditingController digunakan untuk mengontrol dan mengambil nilai input dari pengguna pada setiap field formulir, seperti judul buku, penulis, deskripsi, dan link gambar.
