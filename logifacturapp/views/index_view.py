from django.views import generic
from django.views import View
from ..models import Facture

class IndexView(generic.ListView):
    template_name = "logifacturapp/index.html"
    context_object_name = "facture_list"

    def get_queryset(self):
        return Facture.objects.order_by("-date_facture")