# forms.py
from django import forms
from . .models import Cat_facture, Methode_paiement

class FactureImportForm(forms.Form):
    excel_file = forms.FileField(
        label="",
        widget=forms.ClearableFileInput(attrs={'class': 'custom-file-upload'}),
    )
    categorie = forms.ModelChoiceField(queryset=Cat_facture.objects.all(), label='Catégorie')
    m_paiement = forms.ModelChoiceField(queryset=Methode_paiement.objects.all(), label='Méthode de paiement')
    
    STATUT_CHOICES = (
        ('', 'Statut du paiement'),
        ('1', 'Payé'),
        ('0', 'Non Payé'),
    )
    statut = forms.ChoiceField(choices=STATUT_CHOICES, label='Statut du paiement')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['categorie'].empty_label = 'Catégorie'
        self.fields['m_paiement'].empty_label = 'Méthode de paiement'
        


