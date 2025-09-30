from django.urls import path
from . import views

urlpatterns = [
    path("predict/", views.predict_view, name="predict"),
    path("batch_predict/", views.batch_predict_view, name="batch_predict"),  # batch
]