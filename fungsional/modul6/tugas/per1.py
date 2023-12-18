from PIL import Image, ImageDraw, ImageFont

# Buka gambar
gambarku = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\percobaan.jpg")

# Ubah gambar menjadi hitam-putih (grayscale)
gambarBW = gambarku.convert("L")

draw = ImageDraw.Draw(gambarBW)
font_path = "C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\Alegreya-VariableFont_wght.ttf"
font = ImageFont.truetype(font_path, 150)
text = "Kristin Wulandari 202110370311237"
text_width = draw.textlength(text, font)
text_x = (gambarku.width - text_width) // 2
text_y = 500
draw.text((text_x, text_y), text, 255, font)

# Simpan gambar hasil edit
gambarBW.save("percobaan_satu.jpg")

# Tampilkan hasil pengolahan gambar
gambarBW.show()
