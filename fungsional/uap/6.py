def generator_angka_ganjil():
    for angka in range(51):
        if angka % 2 != 0:
            yield angka

# Membuat generator
gen = generator_angka_ganjil()

# Menampilkan hasil menggunakan iterasi
for angka in gen:
    print(angka)
