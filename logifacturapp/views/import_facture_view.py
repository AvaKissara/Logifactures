import pandas as pd
import openpyxl
import re
from django.views import View
from django.shortcuts import render
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from ..forms import FactureImportForm
from ..models import Facture, Fournisseur, Client, Devise, Methode_paiement, User

@method_decorator(login_required, name='dispatch')
class ImportFactureView(View):
    template_name = "logifacturapp/import_facture.html"

    def get(self, request):
        form = FactureImportForm()
        return render(request, self.template_name, {"form": form})

    def post(self, request):
        form = FactureImportForm(request.POST, request.FILES)

        if form.is_valid():
            excel_file = request.FILES['excel_file']
            categorie = form.cleaned_data['categorie']
            m_paiement = form.cleaned_data['m_paiement']
            statut = form.cleaned_data['statut']
            workbook = openpyxl.load_workbook(excel_file)
            sheet = workbook['Feuille 1']
            cell = sheet['H2']
            cell_format = cell.number_format
            symbol_match = re.search(r'\[([^\]]+)\]', cell_format)
            currency_symbol = symbol_match.group(1)[1]

        try:
            df = pd.read_excel(excel_file)
            user_id = request.user.id
            fournisseur_instances = Fournisseur.objects.all()
            client_instances = Client.objects.all()
            devise_instances = Devise.objects.all()
            user_instances = User.objects.all()

            for index, row in df.iterrows():
                if pd.notna(row['Fournisseur']) and row['Fournisseur'] == 'Siret':
                    siret_value = row.iloc[1]  
                if pd.notna(row['Client']):
                    if 'Nom' in row['Client']:
                        client_name = row.iloc[3]     

                fournisseur_instance = fournisseur_instances.filter(siret_fourn=siret_value).first()
                client_instance = client_instances.filter(nom_client=client_name).first()
                devise_instance = devise_instances.filter(symb_devise= currency_symbol).first()
                user_instance = user_instances.get(id_user=user_id)
                

                Facture.objects.create(
                    cat_facture=categorie,
                    fournisseur=fournisseur_instance,
                    client=client_instance,
                    devise=devise_instance,
                    methode_paiement=m_paiement,
                    user=user_instance,
                    num_facture=row['Numéro de facture'],
                    date_facture=row['Date de facture'],
                    total_ht_facture=row['Total HT'],
                    total_ttc_facture=row['Total TTC'],
                    statut_facture=statut,
                )
        

            messages.success(request, 'Importation des factures réussie.')
        except Exception as e:
            error_message = f"Erreur lors de l'importation : {str(e)}, Contenu de df.iterrows(): {list(df.iterrows())}"
            messages.error(request,  error_message)

        else:
            form = FactureImportForm()

        return render(request, 'logifacturapp/import_facture.html', {'form': form})
