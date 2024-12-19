data_barang = [
    'Pensil', 1500,
    'Buku', 5000,
    'Penggaris', 2000
]

def pisah(data):
    barang = []
    harga = []
    for i in range(0, len(data), 2):
        barang.append(data[i])
        harga.append(data[i + 1])
    return barang, harga

barang_list, harga_list = pisah(data_barang)

def gabung(barang, harga):
    data_dict = {}
    for i in range(len(barang)):
        data_dict[barang[i]] = harga[i]
    return data_dict

data_dict = gabung(barang_list, harga_list)

print("", data_barang)
print("", barang_list, "", harga_list)
print("", data_dict)