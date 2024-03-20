from django import forms
from ..models import Facture

class FactureForm(forms.ModelForm):
    tva_facture = forms.DecimalField(label='TVA (%)', widget=forms.TextInput(attrs={'id': 'id_tva_facture'}))
    date_e_paie_facture = forms.DateField(label='Date de paiement')
    total_ttc_facture = forms.DecimalField(label='Total TTC', widget=forms.TextInput(attrs={'readonly': 'readonly', 'class': 'disabled-field'}))
    # designation = forms.CharField(label='Désignation', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line1'}))
    # quantite = forms.DecimalField(label='Quantité', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line1'}))
    # prix_unitaire = forms.DecimalField(label='Prix unitaire', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line1'}))
    # designation2 = forms.CharField(label='Désignation', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line2'}))
    # quantite2 = forms.DecimalField(label='Quantité', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line2'}))
    # prix_unitaire2 = forms.DecimalField(label='Prix unitaire', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line2'}))
    # designation3 = forms.CharField(label='Désignation', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line3'}))
    # quantite3 = forms.DecimalField(label='Quantité', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line3'}))
    # prix_unitaire3 = forms.DecimalField(label='Prix unitaire', widget=forms.TextInput(attrs={'class': 'form_bill_line bill_line3'}))

    class Meta:
        model = Facture
        fields = ['num_facture', 'date_facture', 'date_e_paie_facture', 'statut_facture', 'cat_facture', 'fournisseur', 'client', 'devise', 'methode_paiement', 'tva_facture', 'total_ht_facture', 'total_ttc_facture']
        labels = {
            'cat_facture': 'Catégorie',
            'methode_paiement': 'Méthode de paiement',
            'statut_facture' : 'Facture acquittée',
            'num_facture' : 'Numéro de facture',
            'total_ht_facture' : 'Total HT',
            'total_ttc_facture' : 'Total TTC'
        }
        widgets = {
            'date_facture': forms.DateInput(attrs={'type': 'date'}),
            'date_e_paie_facture' :forms.DateInput(attrs={'type': 'date', 'id': 'id_date_e_paie_facture'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        for i in range(1, 4):
            self.fields[f'designation_{i}'] = forms.CharField(label=f'Désignation', widget=forms.TextInput(attrs={ 'class':f'form_bill_line bill_line{i} d{i}'}))
            self.fields[f'quantite_{i}'] = forms.DecimalField(label=f'Quantité', widget=forms.TextInput(attrs={ 'class':f'form_bill_line bill_line{i} q{i}'}))
            self.fields[f'prix_unitaire_{i}'] = forms.DecimalField(label=f'Prix unitaire', widget=forms.TextInput(attrs={ 'class':f'form_bill_line bill_line{i} pu{i}'}))
            
        for field_name, field in self.fields.items():
            if isinstance(field.widget, forms.Select):
                field.empty_label = field.label
            else:
                field.widget.attrs['placeholder'] = field.label



        