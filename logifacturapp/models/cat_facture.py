from django.db import models

class Cat_facture(models.Model):
    id_cat_facture = models.AutoField(primary_key=True, db_column='id_cat_facture', default=None)
    nom_cat_facture = models.CharField(max_length=100)

    def __str__(self):
        return self.nom_cat_facture
    class Meta:
        db_table = 'Cat_facture'