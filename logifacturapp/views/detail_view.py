from django.views import View
from django.views import generic
from . .models import Facture
from django.http import JsonResponse

class DetailView(generic.DetailView):
    model = Facture
    context_object_name = "facture"

    def get(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        facture = Facture.objects.get(pk=pk)
        data = {
            'num_facture' : facture.num_facture,
            'date_facture': facture.date_facture.strftime("%d-%m-%Y"),
            'nom_client': f"{facture.client.nom_client} {facture.client.prenom_client}",
            'r_social_fournisseur': facture.fournisseur.r_social_fourn,
            'total_ht': f"{facture.total_ht_facture} {facture.devise.symb_devise}",
            'total_ttc': f"{facture.total_ttc_facture} {facture.devise.symb_devise}",
            'methode_paiement': facture.methode_paiement.nom_m_paie,
            'statut_facture': facture.statut_facture,
            'cat_facture': facture.cat_facture.nom_cat_facture,
        }
        return JsonResponse(data)