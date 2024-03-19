from django.views.generic import FormView
from ..forms import FactureForm
from ..models import Facture
from django.urls import reverse_lazy
from django.contrib import messages
from openpyxl import Workbook
import openpyxl
from django.http import HttpResponse
from decimal import Decimal
from django.http import HttpResponseRedirect

class CreateFactureView(FormView):
    template_name = 'logifacturapp/ajout_facture.html'
    form_class = FactureForm
    success_url = reverse_lazy('logifacturapp:ajout_facture')

    def form_valid(self, form):
        # Converti les données du formulaire en types appropriés
        num_facture = form.cleaned_data['num_facture']
        date_facture = form.cleaned_data['date_facture']
        date_e_paie_facture = form.cleaned_data['date_e_paie_facture']
        total_ht_facture = Decimal(form.cleaned_data['total_ht_facture'])
        tva_facture = float(form.cleaned_data['tva_facture']) * 0.01
        total_ttc_facture = Decimal(form.cleaned_data['total_ttc_facture'])
        cat_facture = form.cleaned_data['cat_facture']
        fournisseur = form.cleaned_data['fournisseur']
        client = form.cleaned_data['client']
        devise = form.cleaned_data['devise']
        methode_paiement = form.cleaned_data['methode_paiement']
        statut_facture = form.cleaned_data['statut_facture']

        # Affecte les valeurs converties au modèle 
        form.instance.num_facture = num_facture
        form.instance.date_facture = date_facture
        form.instance.date_e_paie_facture = date_e_paie_facture
        form.instance.total_ht_facture = total_ht_facture
        form.instance.tva_facture = tva_facture
        form.instance.total_ttc_facture = total_ttc_facture
        form.instance.cat_facture = cat_facture
        form.instance.fournisseur = fournisseur
        form.instance.client = client
        form.instance.devise = devise
        form.instance.methode_paiement = methode_paiement
        form.instance.statut_facture = statut_facture
        user = self.request.user
        form.instance.user = user
        form.save()
        

        workbook = openpyxl.load_workbook('E:\Projets\Logifacture\logifacturapp\static\modele_doc_facture\Modele-facture.xlsx')
        sheet = workbook['Modèle de facture']

        sheet['C3'] = fournisseur.r_social_fourn
        sheet['C4'] = fournisseur.siret_fourn
        sheet['C5'] = fournisseur.adr_fourn
        sheet['C6'] = fournisseur.adr2_fourn
        sheet['C7'] = fournisseur.ville.nom_ville
        sheet['C9'] = fournisseur.tel_fourn
        sheet['C13'] = client.nom_client
        sheet['C14'] = client.prenom_client
        sheet['C15'] = client.adr_client
        sheet['C16'] = client.adr2_client
        sheet['C17'] = client.ville.nom_ville
        sheet['C19'] = client.tel_client
        sheet['F4'] = num_facture
        sheet['F5'] = date_facture
        sheet['F7'] = date_e_paie_facture
        sheet['F33'] = total_ht_facture
        sheet['F34'] = tva_facture 
   

        response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
        response['Content-Disposition'] = 'attachment; filename=facture_'+num_facture+'.xlsx'

        workbook.save(response)
        return response


        # workbook = openpyxl.Workbook()
        # sheet = workbook.active

        # # Ajoute les en-têtes
        # headers = ['num_facture', 'date_facture', 'total_ht_facture', 'tva_facture', 'total_ttc_facture']
        # sheet.append(headers)

        # # Récupére les données de la facture
        # facture_data = {
        #     'num_facture': form.cleaned_data['num_facture'],
        #     'date_facture': form.cleaned_data['date_facture'],
        #     'total_ht_facture': form.cleaned_data['total_ht_facture'],
        #     'tva_facture': form.cleaned_data['tva_facture'],
        #     'total_ttc_facture': form.cleaned_data['total_ttc_facture'],
        # }

        # # Ajouter les données de la facture dans le fichier Excel
        # row_data = [facture_data[header.lower()] for header in headers]
        # sheet.append(row_data)

        # # Sauvegarde le fichier Excel
        # response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
        # response['Content-Disposition'] = 'attachment; filename=facture.xlsx'
        # workbook.save(response)

        # messages.success(self.request, 'Facture enregistrée avec succès.')
        # return response

        # messages.success(self.request, 'Facture enregistrée avec succès.')
        # return super().form_valid(form)
    
    