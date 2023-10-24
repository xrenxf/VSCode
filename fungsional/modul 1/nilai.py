class Peserta:
    def __init__(self, id, nama, nilai):
        self.id = id
        self.nama = nama
        self.nilai = nilai
        self.hasil_akhir = "Lolos" if nilai >= 75 else "Tidak Lolos"

class Admin:
    def __init__(self):
        self.data_peserta = []

    def input_data_peserta(self, nama, nilai):
        id_peserta = len(self.data_peserta)
        peserta_baru = Peserta(id_peserta, nama, nilai)
        self.data_peserta.append(peserta_baru)
        print(f"Data peserta {nama} berhasil ditambahkan!")

    def edit_nilai_peserta(self, id_peserta, nilai):
        if id_peserta < len(self.data_peserta):
            peserta = self.data_peserta[id_peserta]
            peserta.nilai = nilai
            peserta.hasil_akhir = "Lolos" if nilai >= 75 else "Tidak Lolos"
            print(f"Nilai peserta {peserta.nama} berhasil diubah!")

class Tampil:
    def __init__(self):
        self.id_peserta = None

    def login(self):
        self.id_peserta = int(input("Masukkan ID: "))

    def tampilkan_data(self):
        if self.id_peserta is not None and self.id_peserta < len(admin.data_peserta):
            peserta = admin.data_peserta[self.id_peserta]
            print(f"Nama: {peserta.nama}")
            print(f"Nilai: {peserta.nilai}")
            print(f"Hasil Akhir: {peserta.hasil_akhir}")
        else:
            print("ID peserta tidak valid atau peserta tidak ditemukan!")

admin = Admin()

while True:
    print("\n=== Data Peserta ===")
    print("1. Login Admin")
    print("2. Login Peserta")
    print("3. Keluar")
    pilihan = input("Pilih opsi: ")

    if pilihan == "1":
        admin_username = input("Masukkan username: ")
        admin_password = input("Masukkan password: ")
        # autentikasi admin (username dan password)

        if admin_username == "admin" and admin_password == "123":
            while True:
                print("\n=== Admin Menu ===")
                print("1. Input Data Peserta")
                print("2. Edit Nilai Peserta")
                print("3. Keluar")
                admin_pilihan = input("Pilih opsi: ")

                if admin_pilihan == "1":
                    nama_peserta = input("Masukkan nama peserta: ")
                    nilai_peserta = int(input("Masukkan nilai peserta: "))
                    admin.input_data_peserta(nama_peserta, nilai_peserta)
                elif admin_pilihan == "2":
                    id_peserta = int(input("Masukkan ID peserta: "))
                    nilai_baru = int(input("Masukkan nilai baru: "))
                    admin.edit_nilai_peserta(id_peserta, nilai_baru)
                elif admin_pilihan == "3":
                    break
                else:
                    print("Pilihan tidak valid!")

    elif pilihan == "2":
        peserta_login = Tampil()
        peserta_login.login()
        peserta_login.tampilkan_data()
    elif pilihan == "3":
        break
    else:
        print("Pilihan tidak valid!")
# exception, list peserta