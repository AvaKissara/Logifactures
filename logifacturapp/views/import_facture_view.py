import pandas as pd
from django.views import View
from django.shortcuts import render, redirect
from django.contrib import messages
from . .forms import FactureImportForm 
from ..models import Facture
from ..models import Cat_facture
from ..models import Fournisseur
from ..models import Client
from ..models import Devise
from ..models import Methode_paiement
from ..models import User

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
                fournisseur_instance = fournisseur_instances.get(id_fourn=row['Fournisseur'])
                client_instance = client_instances.get(id_client=row['Client'])
                devise_instance = devise_instances.get(id_devise=row['Devise'])
                m_paie_instance = m_paie_instances.get(id_m_paie=row['Méthode de paiement'])
                user_instance = user_instances.get(id_user=row['Client'])
                
                Facture.objects.create(
                    cat_facture=categorie,
                    fournisseur=fournisseur_instance,
                    client=client_instance,
                    devise = devise_instance,
                    methode_paiement = m_paie_instance,
                    user = user_instance,
                    num_facture=row['Numéro de facture'],
                    date_facture=row['Date de facture'],
                    total_ht_facture=row['Total HT'],
                    total_ttc_facture=row['Total TTC'],
                    statut_facture=row['Statut de la facture'],
                )

            messages.success(request, 'Importation des factures réussie.')
        except Exception as e:
            messages.error(request, f'Erreur lors de l\'importation : {str(e)}')
        else:
            form = FactureImportForm()

        return render(request, 'logifacturapp\import_facture.html', {'form': form})
