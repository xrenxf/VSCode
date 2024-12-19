import numpy as np

# Dekorator untuk transformasi gabungan
def transformasi_gabungan(fungsi):
    def wrapper(x, y, *args, **kwargs):
        # Memanggil fungsi asli untuk transformasi
        hasil_transformasi = fungsi(x, y, *args, **kwargs)

        # Hitung gradien garis setelah transformasi
        gradien_transformasi = hitung_gradien(x, y, *hasil_transformasi)

        # Cetak hasil
        print("\nPersamaan garis baru setelah transformasi:")
        print(format_persamaan_garis(gradien_transformasi, -gradien_transformasi * hasil_transformasi[0] + hasil_transformasi[1]))

        return hasil_transformasi

    return wrapper

# Fungsi untuk melakukan translasi
@transformasi_gabungan
def translasi(x, y, tx, ty):
    return x + tx, y + ty

# Fungsi untuk melakukan rotasi
@transformasi_gabungan
def rotasi(x, y, derajat):
    radian = np.radians(derajat)
    x_rotasi = x * np.cos(radian) - y * np.sin(radian)
    y_rotasi = x * np.sin(radian) + y * np.cos(radian)
    return x_rotasi, y_rotasi

# Fungsi untuk melakukan perbesaran skala
@transformasi_gabungan
def perbesaran_skala(x, y, faktor_x, faktor_y):
    return x * faktor_x, y * faktor_y

# Fungsi untuk menghitung gradien garis
def hitung_gradien(x1, y1, x2, y2):
    return (y2 - y1) / (x2 - x1)

# Fungsi untuk mencetak persamaan garis dalam format yang diinginkan
def format_persamaan_garis(gradien, titik):
    return f"y = {gradien:.2f}x + {titik:.2f}" if titik >= 0 else f"y = {gradien:.2f}x - {-titik:.2f}"

# Meminta input dari pengguna
x_awal = float(input("Masukkan nilai x titik awal: "))
y_awal = float(input("Masukkan nilai y titik awal: "))
gradien_awal = float(input("Masukkan nilai gradien awal: "))

# Menampilkan informasi titik awal
print("\nInformasi titik awal:")
print(f"Titik Awal: ({x_awal}, {y_awal})")
print(f"Gradien Awal: {gradien_awal:.2f}")

# Translasi
tx = float(input("\nMasukkan nilai translasi tx: "))
ty = float(input("Masukkan nilai translasi ty: "))
translasi(x_awal, y_awal, tx, ty)

# Rotasi
derajat_rotasi = float(input("\nMasukkan nilai derajat rotasi: "))
rotasi(x_awal, y_awal, derajat_rotasi)

# Perbesaran skala
faktor_skala_x = float(input("\nMasukkan nilai faktor skala pada sumbu x: "))
faktor_skala_y = float(input("Masukkan nilai faktor skala pada sumbu y: "))
perbesaran_skala(x_awal, y_awal, faktor_skala_x, faktor_skala_y)
