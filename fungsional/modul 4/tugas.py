# PERCOBAAN 1
# Curry function
def perkalian(a):
    def dengan(b):
        return a * b
    return dengan  # Mengembalikan fungsi inner operator

# Higher Order Function (HOF)
def hof():
    # Memanggil fungsi perkalian dengan HOF
    kali_dua = perkalian(2)
    hasil = kali_dua(5)
    print("Hasil HOF:", hasil)

# Curryin
def curryin():
    # Memanggil fungsi perkalian dengan curryin
    hasil_curryin = perkalian(2)(5)
    print("Hasil Curryin:", hasil_curryin)

print("Percobaan 1")
hof()
curryin()

# PERCOBAAN 2
def uppercase_decorator(function):
    def wrapper():
        func_result = function()
        return func_result.upper()
    return wrapper

@uppercase_decorator
def say_hi():
    return 'hello there'

result = say_hi()
print("\nPercobaan 2")
print(result)  # HELLO THERE

# PERCOBAAN 3
def title_decorator(function):
    def wrapper():
        func_result = function()
        make_title = func_result.title()
        print(make_title + " - Data is converted to title case")
        return make_title
    return wrapper

def split_string(function):
    def wrapper():
        func_result = function()
        splitted_string = func_result.split()
        print(str(splitted_string) + " - Then Data is splitted")
        return splitted_string
    return wrapper

@split_string
@title_decorator
def say_hi():
    return 'hello there'

print("\nPercobaan 3")
result = say_hi()

# PERCOBAAN 4
import math

def translasi(tx, ty):
    def transformasi_translasi(x, y):
        return x + tx, y + ty
    return transformasi_translasi

def dilatasi(sx, sy):
    def transformasi_dilatasi(x, y):
        return x * sx, y * sy
    return transformasi_dilatasi

def rotasi(sudut):
    def transformasi_rotasi(x, y):
        radian = math.radians(sudut)
        x_baru = x * math.cos(radian) - y * math.sin(radian)
        y_baru = x * math.sin(radian) + y * math.cos(radian)
        return x_baru, y_baru
    return transformasi_rotasi

def cetak_koordinat(aksi_transformasi, x, y):
    x_baru, y_baru = aksi_transformasi(x, y)
    print(f"Koordinat setelah {aksi_transformasi.__name__}: ({x_baru}, {y_baru})")

# Koordinat awal
titik_P = (3, 5)

print("\nPercobaan 4")
# Translasi
translasi_aksi = translasi(2, -1)
cetak_koordinat(translasi_aksi, *titik_P)

# Dilatasi
dilatasi_aksi = dilatasi(2, -1)
cetak_koordinat(dilatasi_aksi, *titik_P)

# Rotasi
rotasi_aksi = rotasi(30)
cetak_koordinat(rotasi_aksi, *titik_P)

# PERCOBAAN 5
def point(x, y):
    return x, y

def line_equation_of(p1, p2):
    def calculate_slope(p1, p2):
        return (p2[1] - p1[1]) / (p2[0] - p1[0])

    def calculate_intercept(p, m):
        return p[1] - m * p[0]

    # Menghitung nilai M (slope/gradien)
    M = calculate_slope(p1, p2)

    # Menghitung nilai C (intercept)
    C = calculate_intercept(p1, M)

    return f"y = {M:.2f}x + {C:.2f}"

print("\nPercobaan 5")
# Untuk NIM Ganjil
print("Persamaan garis yang melalui titik A dan B (NIM Ganjil):")
print(line_equation_of(point(1, 3), point(5, 9)))

# Untuk NIM Genap
print("Persamaan garis yang melalui titik A dan B (NIM Genap):")
print(line_equation_of(point(4, -2), point(-1, 3)))

# PERCOBAAN 6
def point(x, y):
    return x, y

# NIM Ganjil
def line_equation_of_ganjil(x1, y1, M):
    # TODO 1: Tulis rumus untuk mendapatkan nilai C disini
    C = y1 - M * x1
    return f"y = {M:.2f}x + {C:.2f}"

# NIM Genap
def line_equation_of_genap(p1, M):
    # TODO 1: Gunakan inner function dan closure untuk menghitung nilai C
    def calculate_C(p1, M):
        return p1[1] - M * p1[0]

    # TODO 2: Panggil fungsi inner untuk mendapatkan nilai C
    C = calculate_C(p1, M)

    return f"y = {M:.2f}x + {C:.2f}"

print("\nPercobaan 6")
# Uji coba untuk NIM ganjil (contoh NIM: 1234)
print("Persamaan garis yang melalui titik (6,-2) dan bergradien -2:")
print(line_equation_of_ganjil(6, -2, -2))

# Uji coba untuk NIM genap (contoh NIM: 1230)
print("Persamaan garis yang melalui titik (6,-2) dan bergradien 2:")
print(line_equation_of_genap(point(6, -2), 2))
