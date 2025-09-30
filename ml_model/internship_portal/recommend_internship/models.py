from django.db import models

class Application(models.Model):
    age = models.IntegerField()
    gender = models.CharField(max_length=10)
    user_location = models.CharField(max_length=50)
    internship_location = models.CharField(max_length=50)
    graduation_year = models.IntegerField()
    gpa = models.FloatField()
    experience = models.FloatField()
    user_skills = models.TextField()  # comma-separated
    required_skills = models.TextField()  # comma-separated
    company = models.CharField(max_length=50)
    sector = models.CharField(max_length=50)
    role = models.CharField(max_length=50)
    is_selected = models.BooleanField(default=False)