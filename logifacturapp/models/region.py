from django.db import models
from .pays import Pays

class Region(models.Model):
    id_reg = models.AutoField(primary_key=True, db_column='id_reg', default=None)
    nom_reg = models.CharField(max_length=60)
    pays = models.ForeignKey('Pays', on_delete=models.CASCADE)

    def __str__(self):
        return self.nom_reg
    class Meta:
        db_table = 'Region'