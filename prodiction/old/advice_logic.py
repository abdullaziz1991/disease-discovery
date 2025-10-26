# advice_logic.py
from advice_mapping import advice_mapping

def get_advice(disease):
    """
    Get medical advice for predicted disease
    :param disease: str disease name
    :return: list of advice strings
    """
    return advice_mapping.get(disease.strip(), ["Consult a healthcare professional"])

# تأخذ اسم المرض المتوقع كمدخل وتبحث عن النصيحة الطبية المناسبة من قاموس advice_mapping.
# إذا لم يتم العثور على نصيحة لهذا المرض، يتم إرجاع النص الافتراضي:
# "Consult a healthcare professional" (استشر أخصائي الرعاية الصحية).