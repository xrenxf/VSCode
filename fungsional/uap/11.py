def hitung_pangkat(pangkat):
    def pangkat_bilangan(x):
        return x ** pangkat
    return pangkat_bilangan

# Contoh penggunaan
pangkat_dua = hitung_pangkat(2)
pangkat_tiga = hitung_pangkat(3)

# Menghitung pangkat 2 dari 5
hasil_pangkat_dua = pangkat_dua(5)
print(hasil_pangkat_dua)  # Output: 25

# Menghitung pangkat 3 dari 5
hasil_pangkat_tiga = pangkat_tiga(5)
print(hasil_pangkat_tiga)  # Output: 125
