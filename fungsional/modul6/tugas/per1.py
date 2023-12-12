from PIL import Image, ImageDraw, ImageFont

# Buka gambar
gambarku = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\percobaan.jpg")

# Ubah gambar menjadi hitam-putih (grayscale)
gambarBW = gambarku.convert("L")

draw = ImageDraw.Draw(gambarBW)
font = ImageFont.truetype("C:\\Users\\krist\\Downloads\\arial-black\\ariblk.ttf", 24)
text = "Nama: Kristin\nNIM: 237"
text_width, text_height = draw.textsize(text, font)
text_x = (gambarku.width - text_width) // 2
text_y = 20
draw.text()

# Simpan gambar hasil edit
gambarBW.save("percobaan_satu.jpg")

# Tampilkan hasil pengolahan gambar
gambarBW.show()
