from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from ..models import Client
from ..forms import ClientForm
from django.http import JsonResponse
from django.shortcuts import render

class AddClientView(CreateView):
    model = Client
    form_class = ClientForm
    template_name = 'logifacturapp/ajout_facture.html'
    success_url = reverse_lazy('logifacturapp:ajout_facture')
    
    def post(self, request, *args, **kwargs):
        form = ClientForm(request.POST)
        if form.is_valid():
            nom = form.cleaned_data['nom_client']
            prenom = form.cleaned_data['prenom_client']
            adr1 = form.cleaned_data['adr_client']
            ville = form.cleaned_data['ville']
            
            # Vérifie si un client avec les mêmes informations existe déjà
            existing_client = Client.objects.filter(
                nom_client=nom,
                prenom_client=prenom,
                adr_client=adr1,
                ville=ville,
                user=request.user  
            ).exists()
            
            if existing_client:
                return JsonResponse({'success': False, 'message': 'Un client avec les mêmes informations existe déjà.'})
            else:
                client = form.save(commit=False)
                client.user = request.user
                client.save()
                return JsonResponse({'success': True})
        else:
            return JsonResponse({'success': False, 'errors': form.errors})