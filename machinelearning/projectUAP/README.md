# Prediksi Profit Penjualan Menggunakan Perbandingan Model FFNN dan DNN

📄 Deskripsi Proyek
Proyek ini bertujuan untuk memprediksi kategori profit (‘Profit_Category’) berdasarkan fitur-fitur penjualan dari dataset Superstore. Dua jenis model yang digunakan untuk prediksi ini, yaitu Feedforward Neural Network (FFNN) dan Deep Neural Network (DNN). Dengan membandingkan performa kedua model ,untuk analisis profit penjualan.

📊 Dataset
Dataset yang digunakan berasal dari https://www.kaggle.com/datasets/roopacalistus/superstore. Data ini berisi informasi terkait penjualan, pelanggan, dan produk. Kolom yang digunakan dalam analisis ini adalah:

Fitur Input:
    - Ship Mode: Mode pengiriman barang
    - Segment: Segmentasi pelanggan
    - Category: Kategori produk
    - Sub-Category: Subkategori produk
    - Sales: Nilai penjualan
    - Quantity: Jumlah barang terjual
    - Discount: Diskon yang diberikan

Fitur Target:
    - Profit_Category: Kategori profit (“Profit” dan “Non-Profit”), dihasilkan berdasarkan nilai kolom “Profit”.

Logika transformasi untuk kolom Profit_Category:
    - Profit: Profit > 0
    - Non-Profit: Profit ≤ 0

🚀 Alur Proyek
1. Preprocessing Data
    - Augmentasi Data: Karena jumlah data asli tidak mencukupi, dilakukan augmentasi data dengan oversampling.
    - Transformasi Fitur:
        - Fitur numerik (“Sales”, “Quantity”, “Discount”) dinormalisasi menggunakan StandardScaler.
        -Fitur kategori diubah menjadi representasi numerik menggunakan OneHotEncoder.
    - Pipeline Preprocessing: Menggunakan ColumnTransformer untuk menerapkan preprocessing ke fitur numerik dan kategori.

2. Pengembangan Model
    a. Feedforward Neural Network (FFNN)
        - Arsitektur sederhana dengan 2 hidden layer.
        - Aktivasi: ReLU untuk hidden layer, softmax untuk output.
        - Optimizer: Adam.

    b. Deep Neural Network (DNN)
        - Arsitektur lebih kompleks dengan 3 hidden layer, lebih banyak neuron, dan dropout untuk mengurangi overfitting.
        - Aktivasi: Sama dengan FFNN.
        - Optimizer: Adam.

    3. Evaluasi Model
        - Metode Evaluasi: Confusion Matrix, Akurasi, Precision, Recall, dan F1-Score.
        - Visualisasi: Kurva akurasi dan loss selama pelatihan, serta Confusion Matrix untuk masing-masing model.

    4. Prediksi Data Baru
        Model digunakan untuk memprediksi kategori profit berdasarkan data baru dengan preprocessing yang telah dilatih.

💻 Bahasa yang Digunakan
Python
    - Library utama: TensorFlow/Keras, Pandas, Scikit-learn, Matplotlib, Seaborn

🔍 Hasil dan Analisis
    - Performa Model: DNN menunjukkan hasil yang lebih baik dalam memprediksi kategori profit dibandingkan FFNN.
    - Visualisasi: Disajikan Confusion Matrix, learning curve, dan plot perbandingan prediksi dengan nilai aktual untuk kedua model.

📂 Struktur Direktori
projectUAP/
|-- dataset/
|   |-- superstore_dataset.csv
|
|-- model/
|   |-- model_dnn.h5
|   |-- model_ffnn.h5
|   |-- preprocessor.joblib
|   |-- ProfitPredict.ipynb
|
|-- src/
|   |-- predict.py
|
|-- README.md