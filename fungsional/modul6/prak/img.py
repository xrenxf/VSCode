from PIL import Image, ImageDraw, ImageFont, ImageFilter

# Langkah 1
background_image = Image.open("background.jpg")
overlay_image = Image.open("overlay.jpg")

# Langkah 2
background_image = background_image.convert("L")  # Konversi ke mode Grayscale
background_image = background_image.rotate(30)  # Rotasi 30 derajat
background_image = background_image.filter(ImageFilter.BLUR)  # Blur

# Langkah 3
brightness_factor = 1.23  # Ganti dengan dua digit NIM terakhir Anda
contrast_factor = 1.45  # Ganti dengan dua digit NIM terakhir Anda
background_image = background_image.point(lambda p: p * brightness_factor)
background_image = background_image.point(lambda p: p * contrast_factor)

# Langkah 4
overlay_size = (150, 150)  # Ganti dengan ukuran sesuai kebutuhan
overlay_image = overlay_image.resize(overlay_size)
background_image.paste(overlay_image, (50, 50), overlay_image)

# Langkah 5
draw = ImageDraw.Draw(background_image)
font = ImageFont.truetype("arial.ttf", 24)  # Ganti dengan path font Arial di sistem Anda
text = "Informatika JOSSS!"
text_position = (50, 200)  # Ganti dengan posisi sesuai kebutuhan
draw.text(text_position, text, font=font)

# Langkah 6
background_image.save("tugas_praktikum_enam.jpg")
