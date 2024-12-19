import streamlit as st  # type: ignore
import subprocess

# Menentukan halaman-halaman aplikasi dengan sidebar
st.sidebar.title("🔎 Navigasi Aplikasi")
st.sidebar.markdown("Mode klasifikasi")
page = st.sidebar.radio(
    "📂 Pilih Halaman:",
    ("📊 Klasifikasi Tabular", "🖼️ Klasifikasi Citra", "📜 Klasifikasi Teks"),
    index=0  
)

# Header kreatif
st.markdown(
    """
    <style>
    .main-header {
        font-size: 40px;
        font-weight: bold;
        color: #ff5722;
        text-align: center;
    }
    </style>
    <div class="main-header">✨ Selamat Datang di Dashboard AI Kreatif! ✨</div>
    """,
    unsafe_allow_html=True,
)

# Menampilkan konten sesuai dengan halaman yang dipilih
if page == "📊 Klasifikasi Tabular":
    st.session_state.page = "📊 Klasifikasi Tabular"
    st.write("Analisis data tabular tanpa ribet!")
    if st.button(" Buka Klasifikasi Tabular"):
        subprocess.run(["streamlit", "run", "src/Tabular.py"])

elif page == "🖼️ Klasifikasi Citra":
    st.session_state.page = "🖼️ Klasifikasi Citra"
    st.write("Kenali gambar dan objek dengan teknologi AI terkini!")
    if st.button("Klasifikasi Citra"):
        subprocess.run(["streamlit", "run", "src/Citra.py"])

elif page == "📜 Klasifikasi Teks":
    st.session_state.page = "📜 Klasifikasi Teks"
    st.write("Analisis dan klasifikasi teks untuk memahami makna di balik kata!")
    if st.button("Klasifikasi Teks"):
        subprocess.run(["streamlit", "run", "src/Teks.py"])