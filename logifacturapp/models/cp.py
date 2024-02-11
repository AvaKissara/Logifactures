from django.db import models
from .ville import Ville

class Cp(models.Model):
    cp = models.CharField(max_length=9, primary_key=True, db_column='cp', default=None)
    ville = models.ForeignKey('Ville', on_delete=models.CASCADE)

    def __str__(self):
        return self.cp
    class Meta:
        db_table = 'Cp'