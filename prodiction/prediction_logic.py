import joblib
import numpy as np
import pandas as pd
from disease_symptoms_map import disease_symptoms  # {disease_name: [symptom1, symptom2, ...]}

# تحميل النموذج والمكوّنات
mlp_model = joblib.load('mlp_disease_model_6_outputs.pkl')  # النموذج ذو 6 مخارج
feature_columns = joblib.load('feature_columns.pkl')        # قائمة الأعراض (112)
label_encoder = joblib.load('label_encoder.pkl')            # لتفسير الناتج الرقمي إلى اسم المرض

# فك التشفير من 6 أرقام إلى رقم مرض
def decode_from_6_outputs(output_vec, base=8):
    num = 0
    for digit in output_vec:
        num = num * base + digit
    return num

def predict_disease(symptom_values: dict):
    # ⚠️ إنشاء DataFrame يحتوي على كل الأعراض، بقيم 0 افتراضية

    input_df = pd.DataFrame(0, index=[0], columns=feature_columns)

    symptom_values = {
    "high_temperature": 1,
    "cough": 1,
    "sore_throat": 1,
    "muscle_pain": 1,
    "fatigue": 1,
    # "exhaustion": 1,
     }

    # ✅ تحديث الأعراض المُدخلة بقيمة صحيحة
    for symptom, value in symptom_values.items():
        if symptom in input_df.columns:
            input_df.at[0, symptom] = int(value)  # ✅ الحل لتفادي التحذير

    # تحويل إلى مصفوفة NumPy (شكل (1, 112))
    input_array = input_df.values

    print("✅ input_array : ", input_array)

    # التنبؤ
    pred = mlp_model.predict(input_array)

    # تقريب وتحوّل إلى أعداد صحيحة
    predicted_output = np.round(pred[0]).astype(int)  # 6 أرقام [0-7] من base=8

    # تحويل 6 أرقام إلى رقم مرض
    predicted_index = decode_from_6_outputs(predicted_output, base=8)

    # التحقق من صحة الرقم وفك اسم المرض
    if predicted_index < len(label_encoder.classes_):
        predicted_disease = label_encoder.classes_[predicted_index]
    else:
        predicted_disease = "Unknown"

    # حساب نسبة التأكد بناءً على الأعراض المتوقعة
    expected_symptoms = disease_symptoms.get(predicted_disease, [])
    matched_symptoms = [s for s in expected_symptoms if int(symptom_values.get(s, 0)) == 1]

    if expected_symptoms:
        confidence = round(len(matched_symptoms) / len(expected_symptoms) * 100, 2)
    else:
        confidence = 0.0

    # Debug info
    # Debug info
    print("✅ Expected disease : ", predicted_disease)
    # print("📋 الأعراض المتوقعة:", expected_symptoms)
    # print("✅ الأعراض المطابقة:", matched_symptoms)
    print("🎯 Confirmation rate", confidence)

    return predicted_disease, confidence






# # ✅ عيّنة من الأعراض لتجربة النموذج (خارج الدالة)
# sample_symptoms = {
#     "high_temperature": 1,
#     "cough": 1,
#     "sore_throat": 1,
#     "muscle_pain": 1,
#     "fatigue": 1,
#     "exhaustion": 1,
# }

# # ✅ استدعاء الدالة لعرض التنبؤ
# predict_disease(sample_symptoms)
