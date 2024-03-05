from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from ..models import Facture

class ChangeStatutFactureView(LoginRequiredMixin, View):
    def post(self, request, pk):
        facture = get_object_or_404(Facture, id_facture=pk, user=request.user)

        # Effectuez le changement de statut ici, par exemple :
        facture.statut_facture = not facture.statut_facture
        facture.save()

        # Retournez une réponse JSON avec le nouveau statut
        return JsonResponse({'acquittée': facture.statut_facture})
