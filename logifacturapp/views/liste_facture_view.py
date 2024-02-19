from django.views import generic
from django.views import View
from ..models import Facture
from django.shortcuts import render, get_object_or_404, redirect

class ListeFactureView(generic.ListView):
    template_name = "logifacturapp/liste_facture.html"
    context_object_name = "facture_list"

    def get_queryset(self):
        return Facture.objects.order_by("-date_facture")