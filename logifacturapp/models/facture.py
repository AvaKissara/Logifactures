from django.db import models
from .cat_facture import Cat_facture
from .fournisseur import Fournisseur
from .client import Client
from .user import User
from .methode_paiement import Methode_paiement

class Facture(models.Model):
    id_facture = models.AutoField(primary_key=True, db_column='id_facture', default=None)
    cat_facture = models.ForeignKey('Cat_facture', on_delete=models.CASCADE)
    fournisseur = models.ForeignKey('Fournisseur', on_delete=models.CASCADE)
    client = models.ForeignKey('Client', on_delete=models.CASCADE)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    methode_paiement =models.ForeignKey('Methode_paiement', on_delete=models.CASCADE, null=True)
    devise = models.ForeignKey('Devise', on_delete=models.CASCADE, default=None)
    num_facture = models.CharField(max_length=40, db_index=True)
    date_facture =  models.DateField()
    total_ht_facture = models.DecimalField(max_digits=10, decimal_places=2)
    total_ttc_facture = models.DecimalField(max_digits=10, decimal_places=2)
    statut_facture = models.BooleanField(default=True)

    def __str__(self):
        return self.num_facture
    class Meta:
        db_table = 'Facture'