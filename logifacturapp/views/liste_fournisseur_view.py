from django.shortcuts import render
from django.views import View
from ..models import Fournisseur, Facture

class ListeFournisseurView(View):
    template_name = "logifacturapp/liste_fournisseur.html"

    def get(self, request, *args, **kwargs):
        user_id = request.user.id
        
        fournisseurs = Fournisseur.objects.filter(facture__user_id=user_id).distinct()

        context = {'fournisseurs': fournisseurs}
        return render(request, self.template_name, context)
