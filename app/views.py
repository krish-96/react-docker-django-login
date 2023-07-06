from django.shortcuts import render
from django.http import HttpResponse

from django.contrib.auth.models import User
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response

# Create your views here.

def home(request):
    return HttpResponse('<h1 style="color:red;text-a;ign:center;">Home page</>')

@api_view(['POST'])
def register(request):
    if request.method == 'POST':
        username = request.data.get('username')
        password = request.data.get('password')
        print("username and password are : ", username, password)
        if username in  User.objects.filter(username=username):
            return Response(f'{username} is already exists!')
        elif username and password:
            user = User.objects.create(username=username, first_name=username)
            user.set_password(password)
            if "is_superuser" in request.data and request.data.get("is_superuser",False) == True:
                user.is_superuser = True
                user.is_staff = True
            user.save()
            if user:
                return Response(f"User created with username : {username}")
        return Response({"details":"Please enter valid username and password!"})
