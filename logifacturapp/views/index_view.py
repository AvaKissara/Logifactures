from django.views.generic import TemplateView
from ..models import Facture

class IndexView(TemplateView):
    template_name = "logifacturapp/index.html"