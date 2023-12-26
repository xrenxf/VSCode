def is_prima(angka):
    if angka < 2:
        return False
    elif angka == 2:
        return True
    else:
        return all(angka % i != 0 for i in range(2, int(angka**0.5) + 1))

# Contoh penggunaan
angka = 13
hasil = is_prima(angka)
print(hasil)
