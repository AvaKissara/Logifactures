from django.views.generic import TemplateView
from ..models import Facture
from django.db.models import Sum
from django.utils import timezone
from django.template.defaultfilters import date as django_date
import datetime


class IndexView(TemplateView):
    template_name = "logifacturapp/index.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user_id = self.request.user.id
        current_year = timezone.now().year

       # Totaux par catégorie pour chaque mois de l'année en cours
        categories_totals = {}
        for month in range(1, 13):
            totals = (
                Facture.objects
                .filter(user=user_id, date_facture__year=current_year, date_facture__month=month)
                .values('cat_facture__nom_cat_facture') 
                .annotate(total_ttc=Sum('total_ttc_facture'))
            )
            month_name = django_date(datetime.date(current_year, month, 1), "F")
            categories_totals[month_name] = [{'nom_cat_facture': entry['cat_facture__nom_cat_facture'], 'total_ttc': entry['total_ttc']} for entry in totals if entry['total_ttc'] is not None]

        context['categories_totals'] = categories_totals


        # Totaux par fournisseur pour chaque mois de l'année en cours
        fournisseurs_totals = {}
        for month in range(1, 13):
            totals = (
                Facture.objects
                .filter(user=user_id, date_facture__year=current_year, date_facture__month=month)
                .values('fournisseur__r_social_fourn') 
                .annotate(total_ttc=Sum('total_ttc_facture'))
            )
            month_name = django_date(datetime.date(current_year, month, 1), "F")
            fournisseurs_totals[month_name] = [{'r_social_fourn': entry['fournisseur__r_social_fourn'], 'total_ttc': entry['total_ttc']} for entry in totals if entry['total_ttc'] is not None]

        context['fournisseurs_totals'] = fournisseurs_totals

        # Totaux par client pour chaque mois de l'année en cours
        clients_totals = {}
        for month in range(1, 13):
            totals = (
                Facture.objects
                .filter(user=user_id, date_facture__year=current_year, date_facture__month=month)
                .values('client__nom_client', 'client__prenom_client') 
                .annotate(total_ttc=Sum('total_ttc_facture'))
            )
            month_name = django_date(datetime.date(current_year, month, 1), "F")
            clients_totals[month_name] = [{'nom_client': entry['client__nom_client'], 'prenom_client': entry['client__prenom_client'], 'total_ttc': entry['total_ttc']} for entry in totals if entry['total_ttc'] is not None]
        context['clients_totals'] = clients_totals

        return context
