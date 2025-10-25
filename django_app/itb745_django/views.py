# from django.http import HttpResponse

# def home(request):
#     return HttpResponse("<h2>Hello ITB745 — Django is running via Docker Compose!</h2>")
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Login
from .forms import LoginForm, RegisterForm

def home(request):
    user = request.session.get('user')
    if not user:
        return redirect('login')
    return render(request, 'home.html', {'user': user})

def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            uname = form.cleaned_data['username']
            pwd = form.cleaned_data['password']
            try:
                user = Login.objects.get(username=uname, password=pwd)
                request.session['user'] = user.username
                return redirect('home')
            except Login.DoesNotExist:
                messages.error(request, 'Invalid Roll No or Admission No')
    else:
        form = LoginForm()
    return render(request, 'login.html', {'form': form})

def register_view(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Registration successful. Please log in.')
            return redirect('login')
    else:
        form = RegisterForm()
    return render(request, 'register.html', {'form': form})

def logout_view(request):
    request.session.flush()
    return redirect('login')
