from django.db import models

class Devise(models.Model):
    id_devise = models.AutoField(primary_key=True, db_column='id_devise', default=None)
    nom_devise = models.CharField(max_length=40)
    abbr_devise = models.CharField(max_length=6)
    symb_devise = models.CharField(max_length=1)

    def __str__(self):
        return self.nom_devise
    class Meta:
        db_table = 'Devise'