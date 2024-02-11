# forms.py
from django import forms

class FactureImportForm(forms.Form):
    excel_file = forms.FileField(label="Sélectionner un fichier Excel")
