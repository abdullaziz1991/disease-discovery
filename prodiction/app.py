
from flask import Flask, request, jsonify
from prediction_logic import predict_disease
from advice_logic import get_advice

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # الحصول على البيانات المدخلة بصيغة JSON
        data = request.get_json()
        
        if not data:
            return jsonify({"error": "No input data provided"}), 400

        # استدعاء دالة التنبؤ للحصول على المرض المتوقع
        predicted_disease = predict_disease(data)
        
        # الحصول على النصيحة الطبية لهذا المرض
        advice = get_advice(predicted_disease)

        # إرجاع النتيجة كـ JSON
        return jsonify({"disease": predicted_disease, "advice": advice})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
  app.run(host='192.168.1.130', port=5000, debug=True)
    # app.run(host='192.168.215.129', port=5000, debug=True)




# @app.route('/predict', methods=['POST'])
# def predict():
#     try:
#         data = request.get_json()
        
#         if not data:
#             return jsonify({"error": "No input data provided"}), 400

#         predicted_disease = predict_disease(data)
#         advice = get_advice(predicted_disease)

#         return jsonify({
#             "disease": predicted_disease,
#             "advice": advice
#         })
    
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500


    # from flask import Flask, request, jsonify
# import joblib
# import pandas as pd
# from advice_mapping import advice_mapping

# app = Flask(__name__)
# # ينشئ تطبيق Flask الأساسي
# # Load artifacts
# model = joblib.load('disease_model.pkl')
# feature_columns = joblib.load('feature_columns.pkl')
# le_classes = joblib.load('label_encoder_classes.pkl')

# def predict_disease(symptom_values):

#     # Create input DataFrame
#     input_df = pd.DataFrame(0, index=[0], columns=feature_columns)
    
#     # Update with input values
#     for symptom, value in symptom_values.items():
#         if symptom in input_df.columns:
#             input_df[symptom] = value
    
#     # Predict
#     prediction = model.predict(input_df)
    
#     # Decode label
#     return le_classes[prediction[0]]


# def get_advice(disease):
#     return advice_mapping.get(disease.strip(), ["Consult a healthcare professional"])
    
# @app.route('/predict', methods=['POST'])
# def predict():
#     try:
#         # Get JSON request data
#         data = request.get_json()
        
#         if not data:
#             return jsonify({"error": "No input data provided"}), 400

#         # Predict disease
#         predicted_disease = predict_disease(data)
        
#         # Get advice
#         advice = get_advice(predicted_disease)

#         # Return response
#         return jsonify({"disease": predicted_disease, "advice": advice})
    
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# if __name__ == '__main__':
#     # app.run(debug=True)
#     # app.run(host='192.168.1.130', port=5000,debug=True)
#     app.run(host='192.168.1.130', port=5000 , debug=True)


# app.py