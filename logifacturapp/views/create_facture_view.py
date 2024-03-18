from django.views.generic import FormView
from ..forms import FactureForm
from django.urls import reverse_lazy
from django.contrib import messages

class CreateFactureView(FormView):
    template_name = 'logifacturapp/ajout_facture.html'
    form_class = FactureForm
    success_url = reverse_lazy('logifacturapp:liste_facture')

    def form_valid(self, form):
        tva_facture = form.cleaned_data.get('tva_facture')
        ht_facture = form.cleaned_data.get('total_ht_facture')
        ttc_facture = ht_facture * (1 + tva_facture / 100)

        # Affecte le montant TTC calculé au champ correspondant dans le formulaire
        form.instance.total_ttc_facture = ttc_facture
        user = self.request.user
        form.instance.user = user
        form.save()
        messages.success(self.request, 'Facture enregistrée avec succès.')  
        return super().form_valid(form)
