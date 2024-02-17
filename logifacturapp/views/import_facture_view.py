import pandas as pd
from django.views import View
from django.shortcuts import render
from django.contrib import messages
from ..forms import FactureImportForm
from ..models import Facture, Fournisseur, Client, Devise, Methode_paiement, User

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

        try:
            df = pd.read_excel(excel_file)
            fournisseur_instances = Fournisseur.objects.all()
            client_instances = Client.objects.all()
            devise_instances = Devise.objects.all()
            m_paie_instances = Methode_paiement.objects.all()
            user_instances = User.objects.all()

            for index, row in df.iterrows():
                if pd.notna(row['Fournisseur']) and row['Fournisseur'] == 'Siret':
                    siret_value = row.iloc[1]  
                if pd.notna(row['Client']):
                    if 'Nom' in row['Client']:
                        client_name = row.iloc[3]     
                                                  
                fournisseur_instance = fournisseur_instances.filter(siret_fourn=siret_value).first()
                client_instance = client_instances.filter(nom_client=client_name).first()
                devise_instance = devise_instances.get(id_devise=row['Devise'])
                m_paie_instance = m_paie_instances.get(id_m_paie=row['Méthode de paiement'])
                user_instance = user_instances.get(id_user=row['User'])

                Facture.objects.create(
                    cat_facture=categorie,
                    fournisseur=fournisseur_instance,
                    client=client_instance,
                    devise=devise_instance,
                    methode_paiement=m_paie_instance,
                    user=user_instance,
                    num_facture=row['Numéro de facture'],
                    date_facture=row['Date de facture'],
                    total_ht_facture=row['Total HT'],
                    total_ttc_facture=row['Total TTC'],
                    statut_facture=row['Statut de la facture'],
                )
        

            messages.success(request, 'Importation des factures réussie.')
        except Exception as e:
            error_message = f"Erreur lors de l'importation : {str(e)}, Contenu de df.iterrows(): {list(df.iterrows())}"
            messages.error(request, error_message)

        else:
            form = FactureImportForm()

        return render(request, 'logifacturapp/import_facture.html', {'form': form})
