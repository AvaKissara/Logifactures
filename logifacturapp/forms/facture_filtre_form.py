from django import forms
from ..models import Cat_facture, Client, Fournisseur

class FactureFilterForm(forms.Form):
    categorie = forms.ModelChoiceField(queryset=Cat_facture.objects.all(), label='Catégorie', required=False)
    client = forms.ModelChoiceField(queryset=Client.objects.all(), label='Client', required=False)
    fournisseur = forms.ModelChoiceField(queryset=Fournisseur.objects.all(), label='Fournisseur', required=False)
    date_min = forms.DateField(label=' du ', required=False, widget=forms.DateInput(attrs={'type': 'date'}))
    date_max = forms.DateField(label='au ', required=False, widget=forms.DateInput(attrs={'type': 'date'}))

    def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)

            # Personnaliser la première option avec le label de votre choix
            self.fields['categorie'].empty_label = 'Catégorie'
            self.fields['client'].empty_label = 'Client'
            self.fields['fournisseur'].empty_label = 'Fournisseur'

 
            for field_name, field in self.fields.items():
                field.widget.attrs['class'] = 'form-control'
                field.label = False  