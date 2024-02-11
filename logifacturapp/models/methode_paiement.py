from django.db import models

class Methode_paiement(models.Model):
    id_m_paie = models.AutoField(primary_key=True, db_column='id_m_paie', default=None)
    nom_m_paie = models.CharField(max_length=20)

    def __str__(self):
        return self.nom_m_paie
    class Meta:
        db_table = 'Methode_paiement'