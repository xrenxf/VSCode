class Admin:
    def input_data_peserta(self, peserta, nama, nilai):
        new_peserta = peserta.copy()
        id_peserta = str(len(peserta))  # Generate a unique ID
        hasil_akhir = "Lolos" if nilai >= 75 else "Tidak Lolos"
        new_peserta.append({'ID': id_peserta, 'Nama': nama, 'Nilai': nilai, 'Hasil Akhir': hasil_akhir})
        return new_peserta

    def edit_data_peserta(self, peserta, id_peserta, nama, nilai):
        for p in peserta:
            if p['ID'] == id_peserta:
                p['Nama'] = nama
                p['Nilai'] = nilai
                p['Hasil Akhir'] = "Lolos" if nilai >= 75 else "Tidak Lolos"
                break
        else:
            print("Peserta tidak ditemukan.")

    def find_data_peserta(self, peserta, id_peserta):
        for p in peserta:
            if p['ID'] == id_peserta:
                return p
        return None
    
    def list_data_peserta(self, peserta):
        print("\n=== Data Peserta ===")
        for p in peserta:
            print(f"ID: {p['ID']}, Nama: {p['Nama']}, Nilai: {p['Nilai']}, Hasil Akhir: {p['Hasil Akhir']}")


class PesertaAkun:
    def __init__(self):
        self.id_peserta = None

    def login(self):
        self.id_peserta = input("Masukkan ID: ")

    def tampilkan_data_diri(self, admin, peserta):
        data_peserta = admin.find_data_peserta(peserta, self.id_peserta)
        if data_peserta:
            return f"ID: {self.id_peserta}, Nama: {data_peserta['Nama']}, Nilai: {data_peserta['Nilai']}, Hasil Akhir: {data_peserta['Hasil Akhir']}"
        else:
            return "Data peserta tidak ditemukan."

admin = Admin()
peserta = [
    {'ID': '0', 'Nama': 'Putri', 'Nilai': 60, 'Hasil Akhir': 'Tidak Lolos'},
    {'ID': '1', 'Nama': 'Eka', 'Nilai': 80, 'Hasil Akhir': 'Lolos'},
    {'ID': '2', 'Nama': 'Nanda', 'Nilai': 78, 'Hasil Akhir': 'Lolos'},
]

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
                    peserta = admin.input_data_peserta(peserta, nama_peserta, nilai_peserta)
                    admin.list_data_peserta(peserta)
                elif admin_pilihan == "2":
                    id_peserta = input("Masukkan ID peserta yang ingin di edit: ")
                    nama_baru = input("Masukkan Nama baru: ")
                    nilai_baru = int(input("Masukkan nilai baru: "))
                    admin.edit_data_peserta(peserta, id_peserta, nama_baru, nilai_baru)
                    admin.list_data_peserta(peserta)
                elif admin_pilihan == "3":
                    break
                else:
                    print("Pilihan tidak valid!")

    elif pilihan == "2":
        peserta_login = PesertaAkun()
        peserta_login.login()
        result = peserta_login.tampilkan_data_diri(admin, peserta)
        print(result)
    elif pilihan == "3":
        break
    else:
        print("Pilihan tidak valid!")