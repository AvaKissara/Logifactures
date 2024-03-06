from django.db import models
from .civilite import Civilite
from .ville import Ville

class Client(models.Model):
    id_client = models.AutoField(primary_key=True, db_column='id_client', default=None)
    civilite = models.ForeignKey('Civilite', on_delete=models.CASCADE)
    ville = models.ForeignKey('Ville', on_delete=models.CASCADE)
    r_social_client = models.CharField(max_length=100, null=True)
    siret_client = models.CharField(max_length=14,  db_index=True, null=True)
    nom_client = models.CharField(max_length=40)
    prenom_client = models.CharField(max_length=40)
    adr_client = models.CharField(max_length=100)
    adr2_client = models.CharField(max_length=100, null=True)
    tel_client = models.IntegerField(null=True)
    mail_client = models.CharField(max_length=180, null=True)
    cree_le = models.DateTimeField(auto_now_add=True)
    modifie_le = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.nom_client} {self.prenom_client}"
    class Meta:
        db_table = 'Client'