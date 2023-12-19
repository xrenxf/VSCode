from PIL import Image, ImageDraw, ImageFont, ImageFilter, ImageEnhance

# Buka gambar
background = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\prak\\background.jpg")
overlay = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\prak\\overlay.jpg")

# Ubah gambar menjadi hitam-putih (grayscale)
backgroundBW = background.convert("L")
backgroundBW = backgroundBW.rotate(30)
backgroundBW = backgroundBW.filter(ImageFilter.BLUR)

overlay = overlay.convert("RGBA")
overlay = overlay.resize((400, 400))

overlay_brightness = ImageEnhance.Brightness(overlay)
overlay = overlay_brightness.enhance(1.3)

overlay_contrast = ImageEnhance.Contrast(overlay)
overlay = overlay_contrast.enhance(1.7)

# Sisipkan gambar overlay ke dalam gambar background
backgroundBW.paste(overlay, (0, 0), overlay)

draw = ImageDraw.Draw(backgroundBW)
font_path = "C:\\Users\\krist\\VSCode\\fungsional\\modul6\\prak\\Alegreya-VariableFont_wght.ttf"
font = ImageFont.truetype(font_path, 150)
text = "Informatika JOSSS!"
text_width = draw.textlength(text, font)
text_x = (background.width - text_width) // 2
text_y = 500
draw.text((text_x, text_y), text, 255, font)

# Simpan gambar hasil edit
backgroundBW.save("tugas_praktikum_enam.jpg")

# Tampilkan hasil pengolahan gambar
backgroundBW.show()
