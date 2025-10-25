from django import forms
from .models import Login

class LoginForm(forms.Form):
    username = forms.CharField(label="Roll No")
    password = forms.CharField(label="Admission No", widget=forms.PasswordInput)

class RegisterForm(forms.ModelForm):
    class Meta:
        model = Login
        fields = ['username', 'password']
        widgets = {'password': forms.PasswordInput()}
