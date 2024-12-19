import re

def konversi(minggu=0):
    def hari(hari=0):
        def jam(jam=0):
            def menit(menit=0):
                return ((minggu*7 + hari)*24 + jam)*60 + menit
            return menit
        return jam
    return hari

data = ["3 minggu 3 hari 7 jam 21 menit",
        "5 minggu 5 hari 8 jam 11 menit",
        "7 minggu 1 hari 5 jam 33 menit"]

outputData = []

for item in data:
    # Menggunakan ekspresi reguler untuk mengekstrak nilai integer
    components = re.findall(r'\d+', item)
    
    # Mengubah nilai-nilai yang ditemukan menjadi integer
    values = [int(val) for val in components]
    
    # Mengekstrak nilai-nilai individu
    minggu, hari, jam, menit = values
    
    konvert = konversi(minggu)(hari)(jam)(menit)
    outputData.append(konvert)

print("outputData =", outputData)

# Menampilkan nilai-nilai integer saja
for item in data:
    components = re.findall(r'\d+', item)
    print(components)
