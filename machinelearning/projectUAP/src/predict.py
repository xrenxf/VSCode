import streamlit as st
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from tensorflow.keras.models import load_model
from sklearn.preprocessing import StandardScaler
import joblib

# Load pre-trained models and scaler
model_ffnn = load_model('model/model_ffnn.keras')
model_dnn = load_model('model/model_dnn.keras')
scaler = joblib.load('model/preprocessor.joblib')  # Scaler yang digunakan saat pelatihan

# Streamlit app title
st.title("Model Comparison: FFNN vs DNN")
st.markdown("This app allows you to manually input data and compare the performance of FFNN and DNN for profit prediction.")

# Manual data input
st.write("## Input Data")
data = {}
data['Sales'] = st.number_input("Sales", value=0.0)
data['Quantity'] = st.number_input("Quantity", value=0.0)
data['Discount'] = st.number_input("Discount", value=0.0)
data['Ship Mode'] = st.selectbox("Ship Mode", ["First Class", "Second Class", "Standard Class", "Same Day"])
data['Segment'] = st.selectbox("Segment", ["Consumer", "Corporate", "Home Office"])
data['Region'] = st.selectbox("Region", ["East", "West", "Central", "South"])
data['Category'] = st.selectbox("Category", ["Furniture", "Office Supplies", "Technology"])
data['Sub-Category'] = st.selectbox("Sub-Category", ["Bookcases", "Chairs", "Tables", "Accessories", "Appliances", "Art", "Binders", "Envelopes", "Fasteners", "Labels", "Paper", "Storage", "Supplies"])

# Preprocessing categorical data (One-hot encoding example)
categorical_features = ['Ship Mode', 'Segment', 'Region', 'Category', 'Sub-Category']
processed_data = pd.DataFrame([data])
processed_data = pd.get_dummies(processed_data, columns=categorical_features)

# Ensure the order of features matches training data (expected features)
expected_features = [
    'Sales', 'Quantity', 'Discount', 'Ship Mode_First Class', 'Ship Mode_Second Class',
    'Ship Mode_Standard Class', 'Ship Mode_Same Day', 'Segment_Consumer', 'Segment_Corporate',
    'Segment_Home Office', 'Region_East', 'Region_West', 'Region_Central', 'Region_South',
    'Category_Furniture', 'Category_Office Supplies', 'Category_Technology',
    'Sub-Category_Bookcases', 'Sub-Category_Chairs', 'Sub-Category_Tables',
    'Sub-Category_Accessories', 'Sub-Category_Appliances', 'Sub-Category_Art',
    'Sub-Category_Binders', 'Sub-Category_Envelopes', 'Sub-Category_Fasteners',
    'Sub-Category_Labels', 'Sub-Category_Paper', 'Sub-Category_Storage',
    'Sub-Category_Supplies'
]

for feature in expected_features:
    if feature not in processed_data.columns:
        processed_data[feature] = 0

processed_data = processed_data[expected_features]

# Use pre-saved scaler to scale data
processed_data = scaler.transform(processed_data)

# Debugging: Check the shape of input data
st.write("Processed Data Shape:", processed_data.shape)

# Predictions
st.write("## Predictions")

predictions_ffnn = model_ffnn.predict(processed_data)
predictions_dnn = model_dnn.predict(processed_data)

predicted_classes_ffnn = np.argmax(predictions_ffnn, axis=1)
predicted_classes_dnn = np.argmax(predictions_dnn, axis=1)

st.write("### FFNN Predictions")
st.write(f"Prediction: {'Profit' if predicted_classes_ffnn[0] == 1 else 'No Profit'}")

st.write("### DNN Predictions")
st.write(f"Prediction: {'Profit' if predicted_classes_dnn[0] == 1 else 'No Profit'}")

# Comparison visualization
st.write("## Performance Comparison")

# Simulating correct and incorrect predictions (replace with actual data if available)
correct_predictions = [np.sum(predicted_classes_ffnn == 1), np.sum(predicted_classes_dnn == 1)]
incorrect_predictions = [1 - correct_predictions[0], 1 - correct_predictions[1]]  # Assuming binary classification

models = ['FFNN', 'DNN']
fig, ax = plt.subplots()
width = 0.35

rects1 = ax.bar(np.arange(len(models)), correct_predictions, width, label='Correct')
rects2 = ax.bar(np.arange(len(models)) + width, incorrect_predictions, width, label='Incorrect')

ax.set_ylabel('Number of Predictions')
ax.set_title('Comparison of Predictions')
ax.set_xticks(np.arange(len(models)) + width / 2)
ax.set_xticklabels(models)
ax.legend()

def autolabel(rects):
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),
                    textcoords="offset points",
                    ha='center', va='bottom')

autolabel(rects1)
autolabel(rects2)

st.pyplot(fig)

st.write("---")
st.markdown("Developed with ❤️ using Streamlit.")
