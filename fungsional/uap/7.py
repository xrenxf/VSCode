def kurang(a, b):
    return a - b

def sisagold_generator(NIM):
    if NIM % 2 == 1:  # NIM ganjil
        def sisagold(a, b):
            return kurang(a, b)
    else:  # NIM genap
        def sisagold(a, b):
            return kurang(a, b)

    return sisagold

# Contoh penggunaan
NIM_ganjil = 13519021
NIM_genap = 13519022

sisagold_ganjil = sisagold_generator(NIM_ganjil)
hasil_ganjil = sisagold_ganjil(8, 3)
print("Hasil untuk NIM ganjil:", hasil_ganjil)

sisagold_genap = sisagold_generator(NIM_genap)
hasil_genap = sisagold_genap(8, 3)
print("Hasil untuk NIM genap:", hasil_genap)
