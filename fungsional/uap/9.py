# List angka ganjil antara 0 dan 50
angka_ganjil = [angka for angka in range(51) if angka % 2 != 0]

# Fungsi untuk memeriksa kelipatan 3
def kelipatan_tiga(angka):
    return angka % 3 == 0

# Fungsi untuk pemetaan
def tambahkan_informasi(angka):
    return f"{angka} Kelipatan 3"

# Menggunakan filter untuk mendapatkan angka kelipatan 3
angka_kelipatan_tiga = filter(kelipatan_tiga, angka_ganjil)

# Menggunakan map untuk menambahkan informasi pada setiap angka
hasil_pemetaan = list(map(tambahkan_informasi, angka_kelipatan_tiga))

# Menampilkan hasil
print(hasil_pemetaan)
