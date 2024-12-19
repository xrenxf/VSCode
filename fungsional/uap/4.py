tambah_angka = lambda angka, total=0: total + angka

# Contoh penggunaan
total_sekarang = 0
angka1 = 5
angka2 = 3

total_sekarang = tambah_angka(angka1, total_sekarang)
print(total_sekarang)

total_sekarang = tambah_angka(angka2, total_sekarang)
print(total_sekarang)
