from django.shortcuts import render

def home(request):
    return render(request, 'app1/home.html')

def about(request):
    return render(request, 'app1/about.html')

