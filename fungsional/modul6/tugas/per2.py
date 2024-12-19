from PIL import Image

background_image = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\percobaan.jpg")
overlay_image = Image.open("C:\\Users\\krist\\VSCode\\fungsional\\modul6\\tugas\\overlay.jpg")

overlay_image = overlay_image.convert("RGB")
overlay_image = overlay_image.resize((500, 500))

x_center = (background_image.width - overlay_image.width) // 2
y_center = (background_image.height - overlay_image.height) // 2

background_image.paste(overlay_image, (x_center, y_center))

background_image.save("result_image.jpg")

background_image.show()
