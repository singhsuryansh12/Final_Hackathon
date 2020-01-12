from django.db import models

# Create your models here.
class predict(models.Model):
    firstname=models.CharField(max_length=16)
    lastname=models.CharField(max_length=16)
    grescore=models.IntegerField()
    toeflscore=models.IntegerField()
    unirating=models.IntegerField()
    sop=models.IntegerField()
    lor=models.IntegerField()
    cgpa=models.IntegerField()
    research=models.IntegerField()

    def __str__(self):
        return self.firstname