from django.http import JsonResponse
from django.views import View
from ..models import Fournisseur

class GetFournisseursView(View):
    def get(self, request, *args, **kwargs):
        fournisseurs = Fournisseur.objects.all().values('id_fourn', 'r_social_fourn') 
        return JsonResponse(list(fournisseurs), safe=False)
