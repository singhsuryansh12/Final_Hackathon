from django.shortcuts import render
from . forms import MyForm
from rest_framework import viewsets
from rest_framework.decorators import api_view
from django.core import serializers
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from . models import approvals
from . serializers import approvalsSerializers
import pickle
from sklearn.externals import joblib
import json
import numpy as np
from sklearn import preprocessing
import pandas as pd

import pyrebase from django.shortcuts import render 

"""
config = {
'apiKey': "AIzaS--your config here ---fOMd4pYUkbkZVvI",
'authDomain': "cpanel-5e873.firebaseapp.com",
'databaseURL': "https://cpanel-5e873.firebaseio.com",
'projectId': "cpanel-5e873",
'storageBucket': "cpanel-5e873.appspot.com",
'messagingSenderId': "579985583952"
}
firebase = pyrebase.initialize_app(config)
auth = firebase.auth()
def singIn(request):
return render(request, "signIn.html")
def postsign(request):
email=request.POST.get('email')
passw = request.POST.get("pass")
try:
user = auth.sign_in_with_email_and_password(email,passw)
except:
message = "invalid cerediantials"
return render(request,"signIn.html",{"msg":message})
print(user)
return render(request, "welcome.html",{"e":email})

class PredictView(viewsets.ModelViewSet):
    queryset = predict.objects.all()
    serializer_class = predictSerializers()

"""