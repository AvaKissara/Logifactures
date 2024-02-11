from django.db import models
from .devise import Devise

class Pays(models.Model):
    id_pays = models.CharField(max_length=3, primary_key=True, db_column='id_pays', default=None)
    nom_pays = models.CharField(max_length=45)
    indicatif_pays = models.SmallIntegerField(default=0)

    def __str__(self):
        return self.nom_pays
    class Meta:
        db_table = 'Pays'