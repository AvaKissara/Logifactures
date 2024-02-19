import pandas as pd
import openpyxl
import re
from django.views import View
from django.shortcuts import render
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from ..forms import FactureImportForm
from ..models import Facture, Fournisseur, Client, Devise, User

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
            sheet = workbook['Modèle de facture']
            cell = sheet['F34']
            cell_format = cell.number_format
            symbol_match = re.search(r'\[([^\]]+)\]', cell_format)
            currency_symbol = symbol_match.group(1)[1]

        try:
            df = pd.read_excel(excel_file, usecols='B:F', skiprows=1)
            user_id = request.user.id
            fournisseur_instances = Fournisseur.objects.all()
            client_instances = Client.objects.all()
            devise_instances = Devise.objects.all()
            user_instances = User.objects.all()

            # Boucle qui balaie le fichier excel et récupère les valeurs
            for index, row in df.iterrows():
                if pd.notna(row['Fournisseur']) :
                    if df['Fournisseur'][1] == 'Siret':
                        siret_value = df.iloc[1]['vfournisseur'] 
                    if df['Fournisseur'][8] == 'Client':
                        client_name = df.iloc[9]['vfournisseur'] 
                if pd.notna(row['Facture']):
                    if df['Facture'][1] == 'Numéro de facture':
                        num_facture = df.iloc[1]['vfacture']
                    if df['Facture'][2] == 'Date de facture':
                        date_facture = df.iloc[2]['vfacture']
                    if df['Facture'][29] == 'TOTAL HT :':
                        ht_facture = df.iloc[29]['vfacture']       
                    if df['Facture'][31] == 'TOTAL TTC :':
                        ttc_facture = df.iloc[31]['vfacture']                     

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
                num_facture=num_facture,
                date_facture=date_facture,
                total_ht_facture=ht_facture,
                total_ttc_facture=ttc_facture,
                statut_facture=statut,
            )      
            messages.success(request, 'Importation des factures réussie.')
        except Exception as e:
            error_message = f"Erreur lors de l'importation : {str(e)}, Contenu de df.iterrows(): {list(df.iterrows())}"
            messages.error(request,  error_message)

        else:
            form = FactureImportForm()

        return render(request, 'logifacturapp/import_facture.html', {'form': form})
