from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from ..models import Fournisseur
from ..forms import FournisseurForm
from django.http import JsonResponse
from django.shortcuts import render

class AddFournisseurView(CreateView):
    model = Fournisseur
    form_class = FournisseurForm
    template_name = 'logifacturapp/ajout_facture.html'
    success_url = reverse_lazy('logifacturapp:ajout_facture')
    
    def get(self, request, *args, **kwargs):
            form = FournisseurForm()
            return render(request, 'logifacturapp/ajout_facture.html', {'form': form})
    
    def get_all_fournisseurs(request):
        fournisseurs = Fournisseur.objects.all().values('id', 'nom') 
        return JsonResponse(list(fournisseurs), safe=False)

    def post(self, request, *args, **kwargs):
        form = FournisseurForm(request.POST)
        if form.is_valid():
            user = self.request.user
            form.instance.user = user
            fournisseur = form.save()

        return JsonResponse({'success': True})