import random
import math
import os
import django

# --------------------------
# Setup Django environment
# --------------------------
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "internship_portal.settings")  # Replace with your project name
django.setup()

from recommend_internship.models import Application  # Import Django model

# --------------------------
# Config
# --------------------------
N = 2000  # number of applications

genders = ["Male", "Female", "Other"]
locations = ["Nellore", "Bangalore", "Chennai", "Hyderabad", "Pune" , "Lucknow" , "Mysore" , "New Delhi" , "Patna" , "Gurgaon" , "Noida"]
skills_pool = ["Python", "Java", "C++", "SQL", "React", "Node.js", "ML", "Excel" , "Business Analytics" , "Project Management" , "Leadership" , "Communication" , "Legal Knowledge"]
companies = ["Infosys", "TCS", "Wipro", "HCL", "Accenture", "Tech Mahindra" , "MakeMyTrip" , "Bosch India" , "Siemens India" , "Walmart India" , "Mahindra Logistics" , "Tata Steel"]
sectors = ["Software", "Finance", "Consulting", "Healthcare", "Research" , "Technology" , "Manufacturing" , "Pharma" , "Logistics" , "Automobile"]
roles = ["Developer", "Analyst", "Consultant", "Intern", "Engineer" , "Embedded Systems Intern" , "Frontend Developer Intern" , "Finance Intern" , "Logistics Intern" , "Food Technology Intern"]

random.seed(42)

# --------------------------
# Bias rules
# --------------------------
def cond_python_infosys(row): return ("Python" in row["skills_list"] and row["company"] == "Infosys")
def cond_communication_finance(row): return ("Communication" in row["skills_list"] and row["role"] == "Finance Intern")
def cond_nellore_wipro(row): return (row["user_location"] == "Nellore" and row["company"] == "Wipro")
def cond_high_gpa(row): return row["gpa"] >= 8.5
def cond_ml_research(row): return ("ML" in row["skills_list"] and row["sector"] == "Research")
def cond_experienced(row): return row["experience"] >= 2

bias_rules = [
    (cond_communication_finance, 2.5),
    (cond_python_infosys, 2.0),
    (cond_nellore_wipro, 1.5),
    (cond_high_gpa, 1.0),
    (cond_ml_research, 1.2),
    (cond_experienced, 0.8),
]

BASE_LOG_ODDS = -1.5
def sigmoid(x): return 1 / (1 + math.exp(-x))

# --------------------------
# Generate one row
# --------------------------
def generate_row():
    gender = random.choice(genders)
    age = random.randint(20, 26)
    user_location = random.choice(locations)
    internship_location = random.choice(locations)
    graduation_year = random.randint(2020, 2025)
    gpa = round(random.uniform(5.0, 10.0), 2)
    experience = round(random.uniform(0, 3), 2)
    company = random.choice(companies)
    sector = random.choice(sectors)
    role = random.choice(roles)

    # user skills
    k = random.choices([1,2,3], weights=[0.5,0.3,0.2])[0]
    skills_list = random.sample(skills_pool, k)
    skills_str = ",".join(skills_list)

    # internship required skills
    k_req = random.choices([1,2,3], weights=[0.5,0.3,0.2])[0]
    internship_req_list = random.sample(skills_pool, k_req)
    internship_req_str = ",".join(internship_req_list)

    return {
        "age": age,
        "gender": gender,
        "user_location": user_location,
        "internship_location": internship_location,
        "graduation_year": graduation_year,
        "gpa": gpa,
        "experience": experience,
        "user_skills": skills_str,
        "skills_list": skills_list,  # helper
        "required_skills": internship_req_str,
        "internship_req_list": internship_req_list,  # helper
        "company": company,
        "sector": sector,
        "role": role
    }

# --------------------------
# Decide selection (biased)
# --------------------------
def decide_selected(row):
    log_odds = BASE_LOG_ODDS
    for cond, weight in bias_rules:
        if cond(row):
            log_odds += weight
    # boost if user skills match internship
    match_count = len(set(row["skills_list"]) & set(row["internship_req_list"]))
    log_odds += 0.5 * match_count
    log_odds += random.normalvariate(0, 0.2)
    prob = sigmoid(log_odds)
    return 1 if random.random() < prob else 0

# --------------------------
# Generate and insert into DB
# --------------------------
for _ in range(N):
    r = generate_row()
    r["is_selected"] = decide_selected(r)

    # Insert using Django ORM
    Application.objects.create(
        age=r["age"],
        gender=r["gender"],
        user_location=r["user_location"],
        internship_location=r["internship_location"],
        graduation_year=r["graduation_year"],
        gpa=r["gpa"],
        experience=r["experience"],
        user_skills=r["user_skills"],
        required_skills=r["required_skills"],
        company=r["company"],
        sector=r["sector"],
        role=r["role"],
        is_selected=r["is_selected"]
    )

print(f"✅ Inserted {N} application records into the database")