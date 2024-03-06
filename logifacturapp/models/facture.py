from django.db import models
from django.conf import settings 

class Facture(models.Model):
    id_facture = models.AutoField(primary_key=True, db_column='id_facture', default=None)
    cat_facture = models.ForeignKey('Cat_facture', on_delete=models.CASCADE)
    fournisseur = models.ForeignKey('Fournisseur', on_delete=models.CASCADE)
    client = models.ForeignKey('Client', on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    methode_paiement =models.ForeignKey('Methode_paiement', on_delete=models.CASCADE, null=True)
    devise = models.ForeignKey('Devise', on_delete=models.CASCADE, default=None)
    num_facture = models.CharField(max_length=40, unique=True, db_index=True)
    date_facture =  models.DateField()
    total_ht_facture = models.DecimalField(max_digits=10, decimal_places=2)
    total_ttc_facture = models.DecimalField(max_digits=10, decimal_places=2)
    statut_facture = models.BooleanField(default=True)

    def __str__(self):
        return f"Facture {self.id_facture} {self.num_facture} - {self.date_facture}"
    class Meta:
        db_table = 'Facture'