# from django.contrib import admin
# from django.urls import path
# from . import views

# urlpatterns = [
#     path('', views.home, name='home'),
# ]
from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    path('home/', views.home, name='home'),
    path('logout/', views.logout_view, name='logout'),
]
