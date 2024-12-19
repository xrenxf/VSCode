import pandas as pd  # type: ignore
import subprocess
import streamlit as st  # type: ignore
import tensorflow as tf  # type: ignore
import numpy as np  # type: ignore
from pathlib import Path
import joblib  # type: ignore
import altair as alt  # type: ignore

# Tampilan sidebar
st.sidebar.title("🔎 Navigasi Aplikasi")
st.sidebar.markdown("Mode klasifikasi")
page = st.sidebar.radio(
    "🚀 Pilih Halaman:",
    ("📊 Klasifikasi Tabular", "🖼️ Klasifikasi Citra Gambar", "📜 Klasifikasi Teks", "📂 Halaman Utama")
)

# Halaman 1: Klasifikasi Tabular
if page == "📊 Klasifikasi Tabular":
    st.title("📊 Klasifikasi Data Tabular")
    st.markdown(
        "**Ingin tahu hasil prediksi berdasarkan data Anda?** Masukkan data di bawah ini dan lihat hasilnya dengan visualisasi interaktif!"
    )

    # Input data untuk prediksi
    st.subheader("💡 Masukkan Data Anda")

    # Komponen input
    age = st.slider("🧓 Umur (Age)", 0, 100, 25, step=1)
    gender = st.selectbox("👤 Jenis Kelamin (Gender)", ["Laki-laki", "Perempuan"])
    height = st.slider("📏 Tinggi Badan (cm)", 50, 250, 170)
    weight = st.slider("⚖️ Berat Badan (kg)", 20, 150, 70)
    bmi = st.slider("🔢 Indeks Massa Tubuh (BMI)", 10.0, 50.0, 22.0)
    physical_activity_level = st.slider("🏃 Tingkat Aktivitas Fisik", 0, 10, 5)

    # Menampilkan data input
    st.subheader("📊 Data Input Anda")
    input_data = {
        "Umur": age,
        "Jenis Kelamin": gender,
        "Tinggi Badan (cm)": height,
        "Berat Badan (kg)": weight,
        "BMI": bmi,
        "Aktivitas Fisik": physical_activity_level,
    }
    df_input = pd.DataFrame([input_data])
    st.write(df_input)

    # Fungsi prediksi
    def prediction(age, gender, height, weight, bmi, physical_activity_level):
        scaler = joblib.load(Path(__file__).parent / "model/scaler.joblib")
        model = tf.keras.models.load_model(Path(__file__).parent / "model/tabular.h5")

        # Encode gender
        gender_numeric = 0 if gender == "Laki-laki" else 1

        # Scaling dan prediksi
        data = scaler.transform([[age, gender_numeric, height, weight, bmi, physical_activity_level]])
        result = model.predict(data)
        class_index = np.argmax(result, axis=1)
        probabilities = result[0]
        return class_index[0], probabilities

    # Tombol prediksi
    if st.button("🔍 Prediksi Sekarang!"):
        st.subheader("🔮 Hasil Prediksi")
        classes = ["Kelas 0", "Kelas 1", "Kelas 2", "Kelas 3"]  # Ubah label sesuai kebutuhan
        with st.spinner('✨ Memproses prediksi Anda...'):
            class_index, probabilities = prediction(age, gender, height, weight, bmi, physical_activity_level)

        st.success(f"Prediksi: **{classes[class_index]}**")
        st.write("Probabilitas untuk setiap kelas:")
        prob_df = pd.DataFrame({"Kelas": classes, "Probabilitas": probabilities})
        st.altair_chart(
            alt.Chart(prob_df).mark_bar().encode(
                x=alt.X("Kelas", sort=None),
                y="Probabilitas",
                color="Kelas",
                tooltip=["Kelas", "Probabilitas"]
            ).interactive(),
            use_container_width=True
        )

# Halaman 2: Klasifikasi Citra Gambar
elif page == "🖼️ Klasifikasi Citra Gambar":
    st.title("🖼️ Klasifikasi Citra Gambar")
    st.markdown("Unggah gambar Anda untuk mengidentifikasi klasifikasinya!")
    if st.button("📂 Jalankan Modul Klasifikasi Citra"):
        subprocess.run(["streamlit", "run", "src/Citra.py"])

# Halaman 3: Klasifikasi Teks
elif page == "📜 Klasifikasi Teks":
    st.title("📜 Klasifikasi Teks")
    st.markdown(
        "Unggah atau masukkan teks Anda di sini untuk mengetahui klasifikasinya dengan teknologi AI kami."
    )
    if st.button("📂 Jalankan Modul Klasifikasi Teks"):
        subprocess.run(["streamlit", "run", "src/Teks.py"])

elif page == "📂 Halaman Utama":
    st.title("📂Halaman Utama")
    if st.button("🔙 Kembali ke Halaman Utama"):
        subprocess.run(["streamlit", "run", "src/praktikum.py"])
        
