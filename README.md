# 🩺 Disease Discovery App

AI-based disease detection using spoken or selected symptoms

An Android application built with Flutter that allows users to input their symptoms through voice or by selecting from a list.

## Symptoms are analyzed by an MLP-based machine learning model to predict the disease, providing both written and spoken results along with recovery recommendations.

## 🎯 Project Goal

To provide health awareness and an initial automated prediction when a medical consultation is not immediately available.

---

## 📸 App images

<div style="display: flex; gap: 10px; flex-wrap: wrap;">

  <img src="assets/screenshots/1.png" alt="Screenshot 1" width="200"/>
  <img src="assets/screenshots/2.png" alt="Screenshot 2" width="200"/>
  <img src="assets/screenshots/3.png" alt="Screenshot 3" width="200"/>
  <img src="assets/screenshots/4.png" alt="Screenshot 4" width="200"/>

</div>

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

```
