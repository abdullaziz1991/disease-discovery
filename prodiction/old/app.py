
from flask import Flask, request, jsonify
from prediction_logic import predict_disease
from advice_logic import get_advice

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        
        if not data:
            return jsonify({"error": "No input data provided"}), 400

        # احصل على المرض ونسبة التأكد
        predicted_disease, confidence = predict_disease(data)
        
        # النصيحة
        advice = get_advice(predicted_disease)

        return jsonify({
            "disease": predicted_disease,
            # "confidence": f"{confidence}%",
            "confidence": confidence,
            "advice": advice
        })
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
     app.run(host='192.168.1.130', port=5000, debug=True)
    # app.run(host='192.168.43.200', port=5000, debug=True)
    # app.run(host='192.168.79.129', port=5000, debug=True)





# from flask import Flask, request, jsonify
# from prediction_logic import predict_disease
# from advice_logic import get_advice

# app = Flask(__name__)

# @app.route('/predict', methods=['POST'])
# def predict():
#     try:
#         # الحصول على البيانات المدخلة بصيغة JSON
#         data = request.get_json()
        
#         if not data:
#             return jsonify({"error": "No input data provided"}), 400

#         # استدعاء دالة التنبؤ للحصول على المرض المتوقع
#         predicted_disease = predict_disease(data)
        
#         # الحصول على النصيحة الطبية لهذا المرض
#         advice = get_advice(predicted_disease)

#         # إرجاع النتيجة كـ JSON
#         return jsonify({"disease": predicted_disease, "advice": advice})
    
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# if __name__ == '__main__':
#      #   app.run(host='192.168.230.129', port=5000, debug=True)
#      app.run(host='192.168.1.130', port=5000, debug=True)


