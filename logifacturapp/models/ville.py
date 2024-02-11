from django.db import models
from .region import Region

class Ville(models.Model):
    id_ville = models.AutoField(primary_key=True, db_column='id_ville', default=None)
    region = models.ForeignKey('Region', on_delete=models.CASCADE)
    nom_ville = models.CharField(max_length=60)

    def __str__(self):
        return self.nom_ville
    class Meta:
        db_table = 'Ville'