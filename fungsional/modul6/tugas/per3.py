from PIL import Image, ImageEnhance

image = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\percobaan.jpg")

enhancer = ImageEnhance.Brightness(image)
brightened_image = enhancer.enhance(1.5)

enhancer = ImageEnhance.Contrast(brightened_image)
final_image = enhancer.enhance(1.2)

# 3. Simpan gambar hasil edit
final_image.save("brightness_contrast_image.jpg")

# 4. Tampilkan hasilnya
final_image.show()
