from django.db import models

class Civilite(models.Model):
    id_civi = models.AutoField(primary_key=True, db_column='id_civi', default=None)
    nom_civi = models.CharField(max_length=14)
    abbr_civi = models.CharField(max_length=5)

    def __str__(self):
        return self.nom_civi
    class Meta:
        db_table = 'Civilite'