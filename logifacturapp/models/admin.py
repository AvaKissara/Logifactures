from django.db import models
from .civilite import Civilite
from .ville import Ville

class Admin(models.Model):
    id_admin = models.AutoField(primary_key=True, db_column='id_admin', default=None)
    civilite = models.ForeignKey('Civilite', on_delete=models.CASCADE)
    ville = models.ForeignKey('Ville', on_delete=models.CASCADE)
    nom_admin = models.CharField(max_length=40)
    prenom_admin = models.CharField(max_length=40)
    adr_admin = models.CharField(max_length=100)
    adr2_admin = models.CharField(max_length=100)
    tel_admin = models.IntegerField(null=True)
    mail_admin = models.CharField(max_length=180, unique=True)
    mdp_admin = models.CharField(max_length=254)
    sel_admin = models.CharField(max_length=254)

    def __str__(self):
        return f"{self.nom_admin} {self.prenom_admin}"
    class Meta:
        db_table = 'Admin'