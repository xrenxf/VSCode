from functools import reduce

# List angka ganjil antara 0 dan 50
angka_ganjil = [angka for angka in range(51) if angka % 2 != 0]

# Fungsi untuk memeriksa kelipatan 3
def kelipatan_tiga(angka):
    return angka % 3 == 0

# Menggunakan filter untuk mendapatkan angka kelipatan 3
angka_kelipatan_tiga = filter(kelipatan_tiga, angka_ganjil)

# Fungsi untuk penjumlahan
def penjumlahan(x, y):
    return x + y

# Menggunakan reduce untuk mendapatkan hasil penjumlahan
hasil_penjumlahan = reduce(penjumlahan, angka_kelipatan_tiga)

# Menampilkan hasil
print(hasil_penjumlahan)
