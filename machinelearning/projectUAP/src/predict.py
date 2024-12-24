import streamlit as st
import pandas as pd
import joblib
from tensorflow.keras.models import load_model
import plotly.express as px

# Set page configuration
st.set_page_config(page_title="Prediksi Profit Penjualan", layout="wide", page_icon="📊")
st.title("📊 Prediksi Profit Penjualan - FFNN & DNN")

# Load preprocessor and models
@st.cache_resource
def load_resources():
    preprocessor = joblib.load('model/preprocessor.joblib')
    model_ffnn = load_model('model/model_ffnn.h5')
    model_dnn = load_model('model/model_dnn.h5')
    return preprocessor, model_ffnn, model_dnn

preprocessor, model_ffnn, model_dnn = load_resources()

# Tab navigation
tabs = st.tabs(["Input Manual", "Upload File"])

# --- Input Manual ---
with tabs[0]:
    st.subheader("Input Data Manual")
    
    data = {}
    data['Sales'] = st.number_input("Sales", value=0.0, step=0.01, format="%.2f")
    data['Quantity'] = st.number_input("Quantity", value=1, step=1)
    data['Discount'] = st.slider("Discount (%)", value=0.0, min_value=0.0, max_value=100.0)
    data['Ship Mode'] = st.selectbox("Ship Mode", ["First Class", "Second Class", "Standard Class", "Same Day"])
    data['Segment'] = st.selectbox("Segment", ["Consumer", "Corporate", "Home Office"])
    data['Category'] = st.selectbox("Category", ["Furniture", "Office Supplies", "Technology"])
    data['Sub-Category'] = st.selectbox(
        "Sub-Category", ["Bookcases", "Chairs", "Tables", "Accessories", "Appliances", "Art", "Binders", "Envelopes",
        "Fasteners", "Labels", "Paper", "Storage", "Supplies"]
    )

    input_df = pd.DataFrame([data])
    st.write("### Data Input")
    st.write(input_df)

    model_choice = st.radio("Pilih Model untuk Prediksi", ["FFNN", "DNN"], horizontal=True)

    if st.button("Prediksi Manual"):
        try:
            # Preprocess and predict
            processed_input = preprocessor.transform(input_df).toarray()
            model = model_ffnn if model_choice == "FFNN" else model_dnn
            prediction = model.predict(processed_input)

            # Display results
            prediction_label = "Profit" if prediction[0][0] > 0.5 else "Non-Profit"
            st.success(f"Hasil Prediksi: {prediction_label}")
            st.metric(label="Nilai Profit", value=f"{prediction[0][0]:.2f}")
        except Exception as e:
            st.error(f"Terjadi kesalahan: {e}")

# --- Upload File ---
with tabs[1]:
    st.subheader("Upload File untuk Prediksi")
    uploaded_file = st.file_uploader("Unggah File CSV", type="csv")

    if uploaded_file is not None:
        try:
            data = pd.read_csv(uploaded_file)
            st.write("### Data yang Diunggah")
            st.dataframe(data.head())

            processed_data = preprocessor.transform(data).toarray()

            model_choice = st.radio("Pilih Model untuk Prediksi", ["FFNN", "DNN"], key="file_model_choice", horizontal=True)
            model = model_ffnn if model_choice == "FFNN" else model_dnn
            predictions = model.predict(processed_data)

            # Generate results
            prediction_labels = ["Profit" if pred[0] > 0.5 else "Non-Profit" for pred in predictions]
            profit_values = [pred[0] for pred in predictions]
            results = pd.DataFrame({"Kategori": prediction_labels, "Nilai Profit": profit_values})

            st.write("### Hasil Prediksi")
            st.dataframe(results)

            # Visualize predictions
            st.write("### Visualisasi Prediksi")
            fig = px.bar(
                results["Kategori"].value_counts(),
                x=results["Kategori"].value_counts().index,
                y=results["Kategori"].value_counts().values,
                title="Distribusi Prediksi",
                labels={"x": "Kategori", "y": "Jumlah"},
                text_auto=True,
            )
            st.plotly_chart(fig)

            # Download predictions
            csv_output = results.to_csv(index=False).encode("utf-8")
            st.download_button("Unduh Hasil Prediksi", data=csv_output, file_name="predictions.csv", mime="text/csv")

        except Exception as e:
            st.error(f"Terjadi kesalahan: {e}")
