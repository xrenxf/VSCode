# Sistem penilaian akhir mahasiswa

# Fungsi untuk menghitung nilai akhir
def hitung_nilai_akhir(uts, uas):
    return 0.4 * uts + 0.6 * uas

# Fungsi untuk menghitung nilai akhir semua mahasiswa
def hitung_semua_nilai_akhir(data_mahasiswa):
    data_nilai_akhir = {}
    for nama, nilai in data_mahasiswa.items():
        nilai_akhir = hitung_nilai_akhir(nilai['uts'], nilai['uas'])
        data_nilai_akhir[nama] = nilai_akhir
    return data_nilai_akhir

# Fungsi untuk menampilkan nilai akhir mahasiswa
def tampilkan_nilai_akhir(data_nilai_akhir):
    print("Hasil nilai akhir mahasiswa:")
    for nama, nilai_akhir in data_nilai_akhir.items():
        print("Nama: {}\tNilai Akhir: {:.2f}".format(nama, nilai_akhir))

def main():
    data_mahasiswa = {
        'Mahasiswa1': {'uts': 80, 'uas': 90},
        'Mahasiswa2': {'uts': 75, 'uas': 85},
        'Mahasiswa3': {'uts': 90, 'uas': 78},
        # Tambahkan data mahasiswa lainnya sesuai kebutuhan
    }

    data_nilai_akhir = hitung_semua_nilai_akhir(data_mahasiswa)
    tampilkan_nilai_akhir(data_nilai_akhir)

if __name__ == "__main__":
    main()
