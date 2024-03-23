from django.http import JsonResponse
from django.views import View
from ..models import Client

class GetClientsView(View):
    def get(self, request, *args, **kwargs):
        clients = Client.objects.all().values('id_client', 'nom_client', 'prenom_client') 
        return JsonResponse(list(clients), safe=False)
