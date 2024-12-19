from matplotlib import pyplot as plt

data = [
    ('Bus', 5, 200),
    ('Trem', 8, 150),
    ('Kereta', 12, 300),
    ('Minibus', 6, 180),
    ('Tram', 9, 220)
]

jenis_kendaraan, penggunaan_energi, biaya_operasional = zip(*data)

plt.figure(figsize=(15, 5))

# Scatter plot untuk penggunaan energi
plt.subplot(1, 3, 1)
plt.scatter(jenis_kendaraan, penggunaan_energi, color='blue', label='Penggunaan Energi')
plt.title('Penggunaan Energi')
plt.xlabel('Jenis Kendaraan')
plt.ylabel('Penggunaan Energi (liter/100 km)')

# Scatter plot untuk biaya operasional
plt.subplot(1, 3, 2)
plt.scatter(jenis_kendaraan, biaya_operasional, color='green', label='Biaya Operasional')
plt.title('Biaya Operasional')
plt.xlabel('Jenis Kendaraan')
plt.ylabel('Biaya Operasional (ribu Rupiah/km)')

# Scatter plot untuk hubungan antara penggunaan energi dan biaya operasional
plt.subplot(1, 3, 3)
plt.scatter(penggunaan_energi, biaya_operasional, color='red', label='Hubungan')
plt.title('Hubungan Antara Penggunaan Energi dan Biaya Operasional')
plt.xlabel('Penggunaan Energi (liter/100 km)')
plt.ylabel('Biaya Operasional (ribu Rupiah/km)')

plt.legend()

plt.tight_layout()
plt.show()
