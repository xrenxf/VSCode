import streamlit as st  # type: ignore
import tensorflow as tf  # type: ignore
import numpy as np  # type: ignore
from pathlib import Path
import subprocess

# Menentukan navigasi di sidebar
st.sidebar.title("🌟 Navigasi Interaktif")
st.sidebar.markdown("Fitur Klasifikasi")
page = st.sidebar.radio(
    "🚀 Pilih Halaman:",
    ("📊 Klasifikasi Tabular", "🖼️ Klasifikasi Citra", "📜 Klasifikasi Teks"),
    index=1
)

# Halaman Klasifikasi Citra
if page == "🖼️ Klasifikasi Citra":
    st.title("🖼️ Klasifikasi Citra Gambar")
    st.markdown(
        "Gunakan fitur ini untuk mengidentifikasi **jenis objek** dalam gambar yang Anda unggah. Kami mendukung klasifikasi untuk **paper**, **rock**, **scissors**! ✋✊✌️"
    )

    # Unggah citra
    upload = st.file_uploader(
        '🎨 Unggah citra (PNG, JPG) untuk mendapatkan hasil prediksi:',
        type=['png', 'jpg']
    )

    def predict(upload):
        # Kelas untuk klasifikasi
        class_names = ["paper", "rock", "scissors"]

        # Memproses citra
        try:
            img = tf.keras.utils.load_img(upload, target_size=(150, 150))
            img_array = tf.keras.utils.img_to_array(img)
            img_array = img_array / 255.0  # Normalisasi gambar agar nilai piksel berada antara 0 dan 1
            img_array = tf.expand_dims(img_array, 0)
        except Exception as e:
            st.error(f"Terjadi kesalahan saat memproses gambar: {e}")
            return None, None, None

        # Memuat model
        try:
            model = tf.keras.models.load_model(Path(__file__).parent / "model/citra.h5")
        except Exception as e:
            st.error(f"Terjadi kesalahan saat memuat model: {e}")
            return None, None, None

        # Prediksi
        try:
            output = model.predict(img_array)
            score = tf.nn.softmax(output[0])
        except Exception as e:
            st.error(f"Terjadi kesalahan saat melakukan prediksi: {e}")
            return None, None, None

        # Mengembalikan hasil prediksi dan skor
        return class_names[np.argmax(score)], np.max(score), score

    # Tombol untuk prediksi
    if st.button("🔮 Prediksi Gambar"):
        if upload is not None:
            st.image(upload, caption="📸 Gambar yang diunggah", use_column_width=True)
            st.subheader("✨ Hasil Prediksi: ")

            with st.spinner('⚙️ Memproses citra untuk prediksi...'):
                result, confidence, scores = predict(upload)

                if result is not None:
                    # Menampilkan hasil prediksi
                    st.write(f"**🎯 Prediksi Kelas**: {result}")
                    st.write(f"**📊 Probabilitas**: {confidence:.2%}")

                    # Visualisasi probabilitas setiap kelas
                    st.subheader("🔍 Distribusi Probabilitas Kelas:")
                    class_names = ["paper", "rock", "scissors"]
                    st.bar_chart({class_name: score for class_name, score in zip(class_names, scores.numpy())})

                    # Memberikan feedback
                    if confidence > 0.8:
                        st.success(f"🎉 Model sangat yakin bahwa ini adalah gambar **{result}**.")
                    elif confidence > 0.6:
                        st.warning(f"⚠️ Model cukup yakin bahwa ini adalah gambar **{result}**.")
                else:
                    st.warning("⚠️ Tidak dapat melakukan prediksi pada gambar yang diunggah. Silakan coba lagi.")
        else:
            st.warning("🎨 **Unggah gambar terlebih dahulu untuk melanjutkan prediksi!**")

# Halaman Klasifikasi Tabular
elif page == "📊 Klasifikasi Tabular":
    st.title("📊 Klasifikasi Data Tabular")
    st.markdown(
        "Lakukan analisis dan prediksi menggunakan data tabular Anda. 📈"
    )
    if st.button("🔙 Kembali ke Modul Tabular"):
        subprocess.run(["streamlit", "run", "Tabular.py"])

# Halaman Klasifikasi Teks
elif page == "📜 Klasifikasi Teks":
    st.title("📜 Klasifikasi Teks Sentimen")
    st.markdown(
        "Gunakan AI untuk menganalisis sentimen teks Anda, apakah itu **positif** atau **negatif**. Sangat cocok untuk analisis ulasan, komentar, dan lain-lain. 📝"
    )
    if st.button("🔙 Kembali ke Modul Teks"):
        subprocess.run(["streamlit", "run", "Teks.py"])
