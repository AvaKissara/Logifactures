from django.views import generic
from ..models import Facture
from django.contrib.auth.mixins import LoginRequiredMixin
from ..forms import FactureFilterForm
class ListeFactureView(LoginRequiredMixin, generic.ListView):
    template_name = "logifacturapp/liste_facture.html"
    context_object_name = "facture_list"
    form_class = FactureFilterForm

    def get_queryset(self):
        queryset = Facture.objects.filter(user=self.request.user).order_by("-id_facture")

        form = self.form_class(self.request.GET)
        if form.is_valid():
            date_min = form.cleaned_data.get('date_min')
            date_max = form.cleaned_data.get('date_max')
            categorie = form.cleaned_data.get('categorie')
            client = form.cleaned_data.get('client')
            fournisseur = form.cleaned_data.get('fournisseur')

            if date_min:
                queryset = queryset.filter(date_facture__gte=date_min)
            if date_max:
                queryset = queryset.filter(date_facture__lte=date_max)
            if categorie:
                queryset = queryset.filter(cat_facture=categorie)
            if client:
                queryset = queryset.filter(client=client)
            if fournisseur:
                queryset = queryset.filter(fournisseur=fournisseur)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = self.form_class(self.request.GET)
        return context
