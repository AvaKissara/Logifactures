# forms.py
from django import forms
from . .models import Cat_facture

class FactureImportForm(forms.Form):
    excel_file = forms.FileField(label="Sélectionner un fichier Excel")
    categorie = forms.ModelChoiceField(queryset=Cat_facture.objects.all(), label='Catégorie')
