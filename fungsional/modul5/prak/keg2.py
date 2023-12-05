import matplotlib.pyplot as plt

# Daftar data transaksi penjualan produk (nama_produk, harga_produk, jumlah_terjual)
data_transaksi = [
    ('Produk A', 50, 100),
    ('Produk B', 30, 150),
    ('Produk C', 70, 80),
    ('Produk D', 40, 120),
    ('Produk E', 60, 90)
]

# Mengambil informasi dari data transaksi
produk, harga, jumlah_terjual = zip(*data_transaksi)

# Menghitung pendapatan untuk setiap produk
pendapatan = [harga_produk * jumlah_terjual_produk for harga_produk, jumlah_terjual_produk in zip(harga, jumlah_terjual)]

# Membuat scatter plot
plt.scatter(harga, jumlah_terjual, color='blue', label='Hubungan Harga dan Jumlah Terjual')
plt.xlabel('Harga Produk')
plt.ylabel('Jumlah Terjual')
plt.title('Scatter Plot: Hubungan Harga dan Jumlah Terjual')
plt.legend()
plt.show()

# Membuat bar plot untuk menyajikan pendapatan produk
plt.bar(produk, pendapatan, color='green')
plt.xlabel('Produk')
plt.ylabel('Pendapatan')
plt.title('Bar Plot: Pendapatan Produk')
plt.show()
