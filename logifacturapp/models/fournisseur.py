from django.db import models
from django.conf import settings 

class Fournisseur(models.Model):
    id_fourn = models.AutoField(primary_key=True, db_column='id_fourn', default=None)
    civilite = models.ForeignKey('Civilite', on_delete=models.CASCADE, null=True, default=None)
    ville = models.ForeignKey('Ville', on_delete=models.CASCADE)
    r_social_fourn = models.CharField(max_length=100)
    siret_fourn = models.CharField(max_length=14, unique=True, db_index=True)
    nom_fourn = models.CharField(max_length=40, null=True)
    prenom_fourn = models.CharField(max_length=40, null=True)
    adr_fourn = models.CharField(max_length=100)
    adr2_fourn = models.CharField(max_length=100, null=True)
    tel_fourn = models.IntegerField(null=True)
    mail_fourn = models.CharField(max_length=180, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    cree_le = models.DateTimeField(auto_now_add=True)
    modifie_le = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.r_social_fourn}"
    class Meta:
        db_table = 'Fournisseur'