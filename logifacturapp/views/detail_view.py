from django.views import View
from django.views import generic
from . .models import Facture

class DetailView(generic.DetailView):
    model = Facture
    template_name = "logifacturapp/detail.html"
    context_object_name = "facture"