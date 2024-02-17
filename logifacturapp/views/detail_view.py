from django.views import View
from django.views import generic
from ..models import Devise
from . .models import Facture

class DetailView(generic.DetailView):
    # devise = get_object_or_404(Devise, pk=devise_id)
    # return render(request, "logifacturapp/detail.html", {"devise":devise})
    model = Facture
    template_name = "logifacturapp/detail.html"
    context_object_name = "facture"