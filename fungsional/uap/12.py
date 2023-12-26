def kalimat_hasil_pengecekan(func):
    def wrapper(angka):
        hasil = func(angka)
        if hasil:
            return f"{angka} adalah bilangan prima."
        else:
            return f"{angka} bukan bilangan prima."
    return wrapper

@kalimat_hasil_pengecekan
def is_prima(angka):
    if angka < 2:
        return False
    elif angka == 2:
        return True
    else:
        return all(angka % i != 0 for i in range(2, int(angka**0.5) + 1))

# Contoh penggunaan setelah di-decorate
angka = 13
hasil = is_prima(angka)
print(hasil)
