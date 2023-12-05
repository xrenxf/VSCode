import matplotlib.pyplot as plt

# List nilai-nilai ujian mahasiswa
nilai_mahasiswa = [75, 80, 90, 65, 70, 85, 95, 78, 88, 92]

# Menghitung rata-rata
rata_rata = sum(nilai_mahasiswa) / len(nilai_mahasiswa)

# Menampilkan rata-rata
print("Rata-rata nilai mahasiswa:", rata_rata)

# Membuat diagram batang
plt.bar(range(1, len(nilai_mahasiswa) + 1), nilai_mahasiswa, color='blue')
plt.xlabel('Mahasiswa')
plt.ylabel('Nilai Ujian')
plt.title('Diagram Batang Nilai Ujian Mahasiswa')
plt.show()
