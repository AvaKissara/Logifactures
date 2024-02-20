from django import forms

class FactureFilterForm(forms.Form):
    date_min = forms.DateField(label='Période du ', required=False, widget=forms.DateInput(attrs={'type': 'date'}))
    date_max = forms.DateField(label='au ', required=False, widget=forms.DateInput(attrs={'type': 'date'}))