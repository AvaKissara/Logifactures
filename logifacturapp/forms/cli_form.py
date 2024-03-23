from django import forms
from ..models import Client

class ClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = '__all__' 
        exclude = ['user']
        labels = {
            'civilite': 'Civilité',
            'r_social_client': 'Raison sociale',
            'siret_client': 'SIRET',
            'nom_client': 'Nom',
            'prenom_client': 'Prénom',
            'adr_client': 'Adresse',
            'adr2_client': 'Complément d\'adresse',
            'tel_client': 'Téléphone',
            'mail_client': 'Adresse e-mail',
        }

    def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            for field_name, field in self.fields.items():
                if isinstance(field.widget, forms.Select):
                    field.empty_label = field.label
                else:
                    self.fields[field_name].widget.attrs['placeholder'] = field.label