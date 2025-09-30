import os
import pandas as pd
import joblib

BASE_DIR = os.path.dirname(__file__)
MODEL_PATH = os.path.join(BASE_DIR, "model.pkl")
MLB_SKILLS_PATH = os.path.join(BASE_DIR, "mlb_skills.pkl")
MLB_REQ_PATH = os.path.join(BASE_DIR, "mlb_req.pkl")
FEATURES_PATH = os.path.join(BASE_DIR, "feature_cols.pkl")


model = joblib.load(MODEL_PATH)
mlb = joblib.load(MLB_SKILLS_PATH)
mlb_req = joblib.load(MLB_REQ_PATH)
feature_cols = joblib.load(FEATURES_PATH)

categorical_cols = ["gender", "user_location", "internship_location", "company", "sector", "role"]

def predict_new_user(new_user: dict):
    # Load saved objects


    # Convert input to DF
    new_user_df = pd.DataFrame([new_user])

    # One-hot encode
    new_user_encoded = pd.get_dummies(new_user_df, columns=categorical_cols, prefix=categorical_cols)

    # Multi-hot encode
    skills_new = mlb.transform([new_user["skills"]])
    skills_df = pd.DataFrame(skills_new, columns=[f"skill_{s}" for s in mlb.classes_])

    req_new = mlb_req.transform([new_user["internship_req_skills"]])
    req_df = pd.DataFrame(req_new, columns=[f"req_skill_{s}" for s in mlb_req.classes_])

    new_user_encoded = pd.concat([new_user_encoded.drop(["skills", "internship_req_skills"], axis=1, errors="ignore"),
                                  skills_df, req_df], axis=1)

    # Align features
    new_user_encoded = new_user_encoded.reindex(columns=feature_cols, fill_value=0)

    # Predict
    prob = model.predict_proba(new_user_encoded)[0][1]
    label = int(model.predict(new_user_encoded)[0])
    return {"label": label, "probability": float(prob)}


def predict_user_for_internships(user_info: dict, internships: list):
    """
    user_info: dict with user data
    internships: list of dicts, each containing internship data including internship_id
    Returns: dict mapping internship_id -> predicted probability
    """
    results = []

    for internship in internships:
        # Combine user and internship info
        data = {**user_info, **internship}
        df = pd.DataFrame([data])

        # One-hot encode categorical
        df_encoded = pd.get_dummies(df, columns=categorical_cols, prefix=categorical_cols)

        # Skills
        user_skills_encoded = mlb.transform([data["skills"]])
        df_user_skills = pd.DataFrame(user_skills_encoded, columns=[f"skill_{s}" for s in mlb.classes_])

        # Internship required skills
        internship_skills_encoded = mlb_req.transform([data["internship_req_skills"]])
        df_req_skills = pd.DataFrame(internship_skills_encoded, columns=[f"req_skill_{s}" for s in mlb_req.classes_])

        # Combine
        df_encoded = pd.concat([df_encoded.drop(["skills", "internship_req_skills"], axis=1, errors='ignore'),
                                df_user_skills, df_req_skills], axis=1)

        # Align with training features
        df_encoded = df_encoded.reindex(columns=feature_cols, fill_value=0)

        # Predict probability
        prob = float(model.predict_proba(df_encoded)[0][1])

        results.append({
            "internship_id": data["internship_id"],
            "score": prob
        })

        # print(data["internship_id"])
        # results[data["internship_id"]] = prob

    return results