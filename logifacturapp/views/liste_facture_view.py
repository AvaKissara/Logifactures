from django.views import generic
from ..models import Facture
from django.contrib.auth.mixins import LoginRequiredMixin

class ListeFactureView(LoginRequiredMixin, generic.ListView):
    template_name = "logifacturapp/liste_facture.html"
    context_object_name = "facture_list"

    def get_queryset(self):
        return Facture.objects.filter(user=self.request.user).order_by("-date_facture")