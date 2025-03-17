# prediction_logic.py
import pandas as pd
import joblib

# Load model and encoders
model = joblib.load('disease_model.pkl')
feature_columns = joblib.load('feature_columns.pkl')
le_classes = joblib.load('label_encoder_classes.pkl')

# يتم تحميل النموذج التدريبي  الذي تم تدريبه مسبقًا باستخدام خوارزمية  لتشخيص الأمراض
# يتم تحميل أسماء الأعمدة وهي قائمة بالأعراض التي يستخدمها النموذج
# يتم تحميل تصنيفات الأمراض لفك تشفير مخرجات النموذج وتحويلها إلى أسماء الأمراض الفعلية

def predict_disease(symptom_values):
    
    # إنشاء DataFrame جديد يحتوي على جميع الميزات وقيمها الافتراضية (0)
    input_df = pd.DataFrame(0, index=[0], columns=feature_columns)
    
    # تحديث القيم المدخلة بالأعراض الفعلية (تحويل القيم المناسبة إلى 1)
    for symptom, value in symptom_values.items():
        if symptom in input_df.columns:
            input_df[symptom] = value
    
    # توقع المرض باستخدام النموذج
    prediction = model.predict(input_df)
    
    # تحويل التوقع إلى اسم المرض باستخدام `le_classes`
    return le_classes[prediction[0]]




# def predict_disease(symptom_values):
#     """
#     Predict disease based on symptoms
#     :param symptom_values: dict of {symptom: value}
#     :return: str predicted disease
#     """
#     input_df = pd.DataFrame(0, index=[0], columns=feature_columns)
    
#     for symptom, value in symptom_values.items():
#         if symptom in input_df.columns:
#             input_df[symptom] = value
    
#     prediction = model.predict(input_df)
#     return le_classes[prediction[0]]