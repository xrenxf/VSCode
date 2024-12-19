import streamlit as st  # type: ignore
import tensorflow as tf  # type: ignore
import numpy as np  # type: ignore
from pathlib import Path
import joblib  # type: ignore
import subprocess

# Navigasi di sidebar
st.sidebar.title("🌟 Navigasi Aplikasi")
st.sidebar.markdown("Mode klasifikasi")
page = st.sidebar.radio(
    "🚀 Pilih Halaman:",
    ("📊 Klasifikasi Tabular", "🖼️ Klasifikasi Citra", "📜 Klasifikasi Teks", "📂 Halaman Utama"),
    index=2
)

# Halaman utama untuk klasifikasi teks
if page == "📜 Klasifikasi Teks":
    st.title("📝 Klasifikasi Teks Sentimen")
    st.markdown(
        "Gunakan AI untuk menganalisis apakah teks Anda memiliki **sentimen positif** atau **negatif**."
    )

    # Menampilkan gambar lokal (ikon atau ilustrasi menarik)
    image_path = Path(__file__).parent / "model/filem.png"
    if image_path.is_file():
        st.image(str(image_path), width=350)
    else:
        st.warning("🚨 Gambar tidak ditemukan. Pastikan file `filem.png` tersedia di folder `model`.")

    # Input teks dari pengguna
    text = st.text_area("✍️ Masukkan teks Anda di sini:", placeholder="Contoh: Produk ini sangat bagus dan berkualitas tinggi!")

    # Fungsi prediksi
    def prediction():
        # Load tokenizer dan model
        tokenizer = joblib.load(Path(__file__).parent / "model/tokenizer.joblib")
        model = tf.keras.models.load_model(Path(__file__).parent / "model/teks.h5")

        # Preprocessing teks
        sequences = tokenizer.texts_to_sequences([text])
        pad_seq = tf.keras.preprocessing.sequence.pad_sequences(
            sequences, maxlen=100, padding='post'
        )

        # Prediksi sentimen
        result = (model.predict(pad_seq) > 0.5).astype("int32")
        return result[0][0]

    # Tombol untuk memulai prediksi
    if st.button("🔍 Analisis Sentimen"):
        st.subheader("📊 Hasil Analisis Sentimen")
        classes = ["❌ Negatif", "✅ Positif"]

        # Simulasi proses prediksi dengan progress bar
        with st.spinner("⏳ Memproses teks Anda..."):
            progress = st.progress(0)
            for percent_complete in range(1, 101):
                progress.progress(percent_complete / 100)
            result = prediction()

        # Tampilkan hasil prediksi dengan warna dinamis
        if result == 0:
            st.markdown(f"<h3 style='color: red;'>Hasil: {classes[result]}</h3>", unsafe_allow_html=True)
        else:
            st.markdown(f"<h3 style='color: green;'>Hasil: {classes[result]}</h3>", unsafe_allow_html=True)

        # Tampilkan detail tambahan dalam expander
        with st.expander("📖 Detail Hasil Prediksi"):
            st.write(f"Teks yang dimasukkan: **{text}**")
            st.write(f"Klasifikasi Sentimen: **{classes[result]}**")

# Logika untuk navigasi halaman lain
elif page == "📊 Klasifikasi Tabular":
    st.title("📊 Klasifikasi Data Tabular")
    st.markdown("Gunakan fitur ini untuk menganalisis data tabular Anda secara otomatis. 📈")
    if st.button("🔙 Kembali ke Modul Tabular"):
        subprocess.run(["streamlit", "run", "src/Tabular.py"])

elif page == "🖼️ Klasifikasi Citra":
    st.title("🖼️ Klasifikasi Citra Gambar")
    st.markdown("Unggah gambar Anda untuk mendapatkan hasil klasifikasi yang cepat dan akurat.")
    if st.button("🔙 Kembali ke Modul Citra"):
        subprocess.run(["streamlit", "run", "src/Citra.py"])

elif page == "📂 Halaman Utama":
    st.title("📂Halaman Utama")
    if st.button("🔙 Kembali ke Halaman Utama"):
        subprocess.run(["streamlit", "run", "src/praktikum.py"])        
