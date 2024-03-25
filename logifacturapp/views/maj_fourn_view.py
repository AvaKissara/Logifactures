from django.views.generic import UpdateView
from django.http import JsonResponse
from django.urls import reverse_lazy
from ..models import Fournisseur
from ..forms import FournisseurForm

class MajFournisseurView(UpdateView):
    model = Fournisseur
    form_class = FournisseurForm
    template_name = 'logifacturapp/ajout_facture.html'
    success_url = reverse_lazy('logifacturapp:ajout_facture')

    def form_valid(self, form):
        user = self.request.user
        form.instance.user = user
        return super().form_valid(form)

    def form_invalid(self, form):
        return JsonResponse({'success': False, 'errors': form.errors})

    def get_queryset(self):
        return Fournisseur.objects.filter(user=self.request.user)

    