import requests

# Django server URL
url = "http://127.0.0.1:8000/batch_predict/"

# User info
user_info = {
    "age": 22,
    "gender": "Male",
    "skills": ["Python", "SQL", "ML"],
    "user_location": "Nellore",
    "graduation_year": 2021,
    "gpa": 8.7,
    "experience": 2.1
}

# List of internships
internships = [
    {
        "internship_id": "xyz1",
        "internship_req_skills": ["Python", "ML"],
        "internship_location": "Bangalore",
        "company": "TCS",
        "sector": "Research",
        "role": "Developer"
    },
    {
        "internship_id": "xyz2",
        "internship_req_skills": ["Python", "SQL"],
        "internship_location": "Hyderabad",
        "company": "Infosys",
        "sector": "IT",
        "role": "Developer"
    },
    {
        "internship_id": "xyz3",
        "internship_req_skills": ["SQL", "ML"],
        "internship_location": "Chennai",
        "company": "Cognizant",
        "sector": "IT",
        "role": "Analyst"
    }
]

# Prepare the payload
payload = {
    "user_info": user_info,
    "internships": internships
}

# Send POST request
res = requests.post(url, json=payload)

# Print status and response
print("Status code:", res.status_code)
try:
    print("Predictions:", res.json())
except Exception as e:
    print("Error parsing JSON:", e)
    print("Raw response:", res.text)