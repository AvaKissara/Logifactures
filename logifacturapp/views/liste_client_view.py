from django.shortcuts import render
from django.views import View
from ..models import Client

class ListeClientView(View):
    template_name = "logifacturapp/liste_client.html"

    def get(self, request, *args, **kwargs):
        user_id = request.user.id
        
        clients = Client.objects.filter(facture__user_id=user_id).distinct().order_by('nom_client')

        context = {'clients': clients}
        return render(request, self.template_name, context)