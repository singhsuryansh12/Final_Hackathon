from rest_framework import serializers
from . models import predict

class predictSerializers(serializers.ModelSerializer):
    class Meta:
        model=predict
        fields='__all__'
        