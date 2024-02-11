from django.db import models
from .civilite import Civilite
from .ville import Ville

class User(models.Model):
    id_user = models.AutoField(primary_key=True, db_column='id_user', default=None)
    civilite = models.ForeignKey('Civilite', on_delete=models.CASCADE)
    ville = models.ForeignKey('Ville', on_delete=models.CASCADE)
    nom_user = models.CharField(max_length=40)
    prenom_user = models.CharField(max_length=40)
    adr_user = models.CharField(max_length=100)
    adr2_user = models.CharField(max_length=100, null=True)
    tel_user = models.IntegerField(null=True)
    mail_user = models.CharField(max_length=180, unique=True)
    mdp_user = models.CharField(max_length=254)
    sel_user = models.CharField(max_length=254)

    def __str__(self):
        return f"{self.nom_user} {self.prenom_user}"
    class Meta:
        db_table = 'User'