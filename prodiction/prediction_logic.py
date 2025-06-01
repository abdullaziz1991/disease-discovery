# prediction_logic.py
# import pandas as pd
# import joblib

# # Load model and encoders
# model = joblib.load('disease_mlp_model.pkl')
# feature_columns = joblib.load('feature_columns.pkl')
# le_classes = joblib.load('label_encoder_classes.pkl')

# # يتم تحميل النموذج التدريبي  الذي تم تدريبه مسبقًا باستخدام خوارزمية  لتشخيص الأمراض
# # يتم تحميل أسماء الأعمدة وهي قائمة بالأعراض التي يستخدمها النموذج
# # يتم تحميل تصنيفات الأمراض لفك تشفير مخرجات النموذج وتحويلها إلى أسماء الأمراض الفعلية

# def predict_disease(symptom_values):
    
#     # إنشاء DataFrame جديد يحتوي على جميع الميزات وقيمها الافتراضية (0)
#     input_df = pd.DataFrame(0, index=[0], columns=feature_columns)
    
#     # تحديث القيم المدخلة بالأعراض الفعلية (تحويل القيم المناسبة إلى 1)
#     for symptom, value in symptom_values.items():
#         if symptom in input_df.columns:
#             input_df[symptom] = value
    
#     # توقع المرض باستخدام النموذج
#     prediction = model.predict(input_df)
    
#     # تحويل التوقع إلى اسم المرض باستخدام `le_classes`
#     return le_classes[prediction[0]]


import pandas as pd
import joblib
from disease_symptoms_map import disease_symptoms

# تحميل النموذج والبيانات
model = joblib.load('disease_mlp_model.pkl')
feature_columns = joblib.load('feature_columns.pkl')
le_classes = joblib.load('label_encoder_classes.pkl')

def predict_disease(symptom_values):
        # ✅ طباعة الأعمدة المتوقعة ومدخلات المستخدم
    # print("Feature columns:", feature_columns)
    # print("Input symptoms received:", symptom_values.keys())
    # إنشاء DataFrame بقيم افتراضية
    input_df = pd.DataFrame(0, index=[0], columns=feature_columns)
    
    # تحديث الأعراض المُدخلة
    for symptom, value in symptom_values.items():
        if symptom in input_df.columns:
            input_df[symptom] = value
    
    # توقع المرض
    prediction = model.predict(input_df)
    predicted_disease = le_classes[prediction[0]]

    # حساب نسبة التأكد بناءً على عدد الأعراض
    expected_symptoms = disease_symptoms.get(predicted_disease, [])
    matched_symptoms = [s for s in expected_symptoms if str(symptom_values.get(s, 0)) == '1']

    
    if expected_symptoms:
        confidence = round(len(matched_symptoms) / len(expected_symptoms) * 100, 2)
    else:
        confidence = 50.0  # أو أي قيمة افتراضية
    # ✅ Debug prints
    
    print("Predicted:", predicted_disease)
    print("Expected symptoms:", expected_symptoms)
    print("Matched symptoms:", matched_symptoms)
    print("Confidence:", confidence)

    return predicted_disease, confidence
