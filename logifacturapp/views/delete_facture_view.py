from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import DeleteView
from django.urls import reverse_lazy
from ..models import Facture

class DeleteFactureView(DeleteView):
    model = Facture
    success_url = reverse_lazy('logifacturapp:liste_facture')

    def get_object(self, queryset=None):
        return get_object_or_404(Facture, id_facture=self.kwargs['facture_id'])