import os
import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MultiLabelBinarizer
import joblib
from recommend_internship.models import Application


BASE_DIR = os.path.dirname(__file__)  # points to recommend_internship/ml
MODEL_PATH = os.path.join(BASE_DIR, "model.pkl")
MLB_SKILLS_PATH = os.path.join(BASE_DIR, "mlb_skills.pkl")
MLB_REQ_PATH = os.path.join(BASE_DIR, "mlb_req.pkl")
FEATURES_PATH = os.path.join(BASE_DIR, "feature_cols.pkl")



def train_model():
    # Load data from DB
    qs = Application.objects.all().values()
    data = pd.DataFrame(qs)

    # Preprocess
    categorical_cols = ["gender", "user_location", "internship_location", "company", "sector", "role"]
    data_encoded = pd.get_dummies(data, columns=categorical_cols, prefix=categorical_cols)

    # Skills multi-hot
    mlb = MultiLabelBinarizer()
    skills_encoded = mlb.fit_transform(data["user_skills"].apply(lambda x: x.split(",")))
    skills_df = pd.DataFrame(skills_encoded, columns=[f"skill_{s}" for s in mlb.classes_])

    mlb_req = MultiLabelBinarizer()
    req_encoded = mlb_req.fit_transform(data["required_skills"].apply(lambda x: x.split(",")))
    req_df = pd.DataFrame(req_encoded, columns=[f"req_skill_{s}" for s in mlb_req.classes_])

    data_encoded = pd.concat([data_encoded.drop(["user_skills", "required_skills"], axis=1), 
                              skills_df, req_df], axis=1)

    # Features & labels
    X = data_encoded.drop(["id", "is_selected"], axis=1, errors="ignore")
    y = data_encoded["is_selected"]

    # Train
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    model = LogisticRegression(max_iter=1000, random_state=42)
    model.fit(X_train, y_train)

    acc = model.score(X_test, y_test)
    print(f"Model trained. Accuracy = {acc:.3f}")

    # Save model & encoders
    joblib.dump(model, MODEL_PATH)
    joblib.dump(mlb, MLB_SKILLS_PATH)
    joblib.dump(mlb_req, MLB_REQ_PATH)
    joblib.dump(list(X_train.columns), FEATURES_PATH)

    return acc