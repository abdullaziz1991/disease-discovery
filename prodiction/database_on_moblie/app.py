import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
import tensorflow as tf

# الخطوة 1: تحميل البيانات
df = pd.read_csv('diseases_dataset.csv')  # ضع اسم الملف هنا

# الخطوة 2: فصل الخصائص (الأعراض) والهدف (المرض)
X = df.drop(columns=['prognosis'])
y = df['prognosis']

# الخطوة 3: ترميز الهدف (المرض)
label_encoder = LabelEncoder()
y_encoded = label_encoder.fit_transform(y)

# حفظ أسماء الأمراض لاستخدامها لاحقًا في Flutter
np.save('labels.npy', label_encoder.classes_)

# الخطوة 4: تقسيم البيانات
X_train, X_test, y_train, y_test = train_test_split(X, y_encoded, test_size=0.2, random_state=42)

# الخطوة 5: بناء النموذج
model = tf.keras.models.Sequential([
    tf.keras.layers.Input(shape=(X.shape[1],)),
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dropout(0.3),
    tf.keras.layers.Dense(64, activation='relu'),
    tf.keras.layers.Dense(len(np.unique(y_encoded)), activation='softmax')
])

model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# الخطوة 6: تدريب النموذج
model.fit(X_train, y_train, epochs=30, batch_size=16, validation_data=(X_test, y_test))

# الخطوة 7: حفظ النموذج
model.save('disease_model.h5')

# الخطوة 8: تحويل النموذج إلى TFLite
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

with open('disease_model.tflite', 'wb') as f:
    f.write(tflite_model)
