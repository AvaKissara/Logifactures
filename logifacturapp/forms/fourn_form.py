from django import forms
from ..models import Fournisseur

class FournisseurForm(forms.ModelForm):
    class Meta:
        model = Fournisseur
        fields = '__all__' 
        exclude = ['user']
        labels = {
            'civilite': 'Civilité',
            'r_social_fourn': 'Raison sociale',
            'siret_fourn': 'SIRET',
            'nom_fourn': 'Nom',
            'prenom_fourn': 'Prénom',
            'adr_fourn': 'Adresse',
            'adr2_fourn': 'Complément d\'adresse',
            'tel_fourn': 'Téléphone',
            'mail_fourn': 'Adresse e-mail',
        }

    def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            for field_name, field in self.fields.items():
                if isinstance(field.widget, forms.Select):
                    field.empty_label = field.label
                else:
                    self.fields[field_name].widget.attrs['placeholder'] = field.label