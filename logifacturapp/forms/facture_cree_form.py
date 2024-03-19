from django import forms
from ..models import Facture

class FactureForm(forms.ModelForm):
    tva_facture = forms.DecimalField(label='TVA (%)', widget=forms.TextInput(attrs={'id': 'id_tva_facture'}))
    date_e_paie_facture = forms.DateField(label='Date de paiement')
    total_ttc_facture = forms.DecimalField(label='Total TTC', widget=forms.TextInput(attrs={'readonly': 'readonly', 'class': 'disabled-field'}))

    class Meta:
        model = Facture
        fields = ['num_facture', 'date_facture', 'date_e_paie_facture', 'total_ht_facture', 'tva_facture', 'total_ttc_facture', 'cat_facture', 'fournisseur', 'client', 'devise', 'methode_paiement','statut_facture']
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
        for field_name, field in self.fields.items():
            # Si c'est un select
            if isinstance(field.widget, forms.Select):
                # label comme valeur par défaut
                field.empty_label = field.label
            # Si c'est un input
            else:
                # label comme placeholder
                field.widget.attrs['placeholder'] = field.label

        