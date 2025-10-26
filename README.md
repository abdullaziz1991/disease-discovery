# 🩺 Disease Discovery App  
AI-powered disease prediction from spoken symptoms

A Flutter-based Android application that allows users to input their symptoms via speech.  
The symptoms are analyzed by a Machine Learning model to predict the most likely disease and provide intelligent voice feedback.

---

## 🎯 Project Goal
To provide health awareness and an initial automated prediction when a medical consultation is not immediately available.

---

## ✨ Features
- 🎤 Speech-to-Text symptom input  
- 🤖 Disease prediction using a trained ML model (MLPClassifier)  
- 🔊 Voice feedback using Text-To-Speech  
- 🌍 Multi-language support with Easy Localization  
- ✅ Clean Architecture + TDD + SOLID + Bloc State Management  
- 📡 Online server communication for AI prediction  
- 📱 Responsive UI using ScreenUtil  
- 🎬 Stunning animations powered by Lottie  
- 🔌 Dependency Injection with get_it & injectable  
- 🌐 Internet connection detection  

---

## 🧠 Machine Learning Backend
- Implemented with Python & Scikit-learn
- Dataset contains multiple symptoms mapped to disease prognosis
- Model used: `MLPClassifier` (Neural Network)
- Model saved and loaded using `joblib`

### Training Example:
```python
df = pd.read_csv('diseases_dataset.csv')
X = df.drop(columns=["prognosis"])
y = df["prognosis"]

le = LabelEncoder()
y_encoded = le.fit_transform(y)

mlp_model = MLPClassifier(
    hidden_layer_sizes=(200, 100),
    activation='relu',
    solver='adam',
    max_iter=500
)

mlp_model.fit(X_train, y_train)
joblib.dump(mlp_model, "disease_model.joblib")

