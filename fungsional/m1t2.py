class Buku:
    def __init__(self, judul, penulis, tersedia=True):
        self.judul = judul
        self.penulis = penulis
        self.tersedia = tersedia

class Admin:
    def __init__(self):
        self.daftar_buku = []

    def input_buku(self, judul, penulis):
        buku_baru = Buku(judul, penulis)
        self.daftar_buku.append(buku_baru)
        print(f"Buku '{judul}' oleh {penulis} berhasil ditambahkan!")

class User:
    def __init__(self):
        self.buku_dipinjam = []

    def pinjam_buku(self, judul, admin):
        for buku in admin.daftar_buku:
            if buku.judul == judul and buku.tersedia:
                buku.tersedia = False
                self.buku_dipinjam.append(buku)
                print(f"Anda berhasil meminjam buku '{judul}'!")
                return
        print(f"Buku '{judul}' tidak tersedia atau sudah dipinjam oleh pengguna lain.")

    def kembalikan_buku(self, judul):
        for buku in self.buku_dipinjam:
            if buku.judul == judul:
                buku.tersedia = True
                self.buku_dipinjam.remove(buku)
                print(f"Anda telah mengembalikan buku '{judul}'.")
                return
        print(f"Anda tidak memiliki buku '{judul}' untuk dikembalikan.")

admin = Admin()
user = User()
# Contoh Judul Buku Laut Bercerita-Leila C. Chudori, Bumi Manusia-Pramoedya Ananta Toer, Saman-Ayu Utami)

while True:
    print("\n=== Sistem Informasi Peminjaman Buku ===")
    print("1. Login Sebagai Admin")
    print("2. Login Sebagai User")
    print("3. Keluar")
    pilihan = input("Pilih opsi: ")

    if pilihan == "1":
        admin_username = input("Masukkan username admin: ")
        admin_password = input("Masukkan password admin: ")
        # logika autentikasi admin (username dan password)

        if admin_username == "admin" and admin_password == "admin":
            while True:
                print("\n=== Admin Menu ===")
                print("1. Input Buku")
                print("2. Keluar")
                admin_pilihan = input("Pilih opsi: ")

                if admin_pilihan == "1":
                    judul = input("Masukkan judul buku: ")
                    penulis = input("Masukkan nama penulis: ")
                    admin.input_buku(judul, penulis)
                elif admin_pilihan == "2":
                    break
                else:
                    print("Pilihan tidak valid!")

    elif pilihan == "2":
        user_name = input("Masukkan username: ")
        user_password = input("Masukkan password: ")
        # logika autentikasi user (username dan password)

        if user_name == "user" and user_password == "user":
            while True:
                print("\n=== User Menu ===")
                print("1. Pinjam Buku")
                print("2. Kembalikan Buku")
                print("3. Keluar")
                user_pilihan = input("Pilih opsi: ")

                if user_pilihan == "1":
                    judul = input("Masukkan judul buku yang ingin dipinjam: ")
                    user.pinjam_buku(judul, admin)
                elif user_pilihan == "2":
                    judul = input("Masukkan judul buku yang ingin dikembalikan: ")
                    user.kembalikan_buku(judul)
                elif user_pilihan == "3":
                   break
                else:
                    print("Pilihan tidak valid!")

    elif pilihan == "3":
        break
    else:
        print("Pilihan tidak valid!")
