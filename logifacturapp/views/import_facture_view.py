import pandas as pd
import openpyxl
import re
from django.views import View
from django.shortcuts import render
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from ..forms import FactureImportForm
from ..models import Facture, Fournisseur, Client, Devise, Ville, Civilite, AgendaEvent 
from datetime import datetime
from django.contrib.auth.models import User

@method_decorator(login_required, name='dispatch')
class ImportFactureView(View):
    template_name = "logifacturapp/import_facture.html"

    def get(self, request):
        form = FactureImportForm()
        return render(request, self.template_name, {"form": form})

    def post(self, request):
        form = FactureImportForm(request.POST, request.FILES)
        context = {}

        if form.is_valid():
            excel_file = request.FILES['excel_file']
            categorie = form.cleaned_data['categorie']
            m_paiement = form.cleaned_data['m_paiement']
            statut = form.cleaned_data['statut']
            workbook = openpyxl.load_workbook(excel_file)
            sheet = workbook['Modèle de facture']
            cell = sheet['F35']
            cell_format = cell.number_format
            symbol_match = re.search(r'\[([^\]]+)\]', cell_format)
            currency_symbol = symbol_match.group(1)[1]

        try:
            df = pd.read_excel(excel_file, usecols='B:F', skiprows=1)
            user_id = request.user.id
            fournisseur_instances = Fournisseur.objects.all()
            client_instances = Client.objects.all()
            devise_instances = Devise.objects.all()
            ville_instances = Ville.objects.all()
            user_instances = User.objects.all()
            civi_instances = Civilite.objects.all()
            facture_instances = Facture.objects.all()

            # Boucle qui balaie le fichier excel et récupère les valeurs
            for index, row in df.iterrows():
                if pd.notna(row['Fournisseur']) :
                    if df['Fournisseur'][0] == 'Raison sociale':
                        r_social_fourn_value = df.iloc[0]['vfournisseur'].lower().strip() 
                    if df['Fournisseur'][1] == 'Siret':
                        siret_fourn_value = df.iloc[1]['vfournisseur']
                    if df['Fournisseur'][2] == 'Adresse':
                        adr_fourn_value = df.iloc[2]['vfournisseur'].lower().strip()
                    if df['Fournisseur'][3] == 'Adresse 2':
                        adr2_fourn_value = df.iloc[3]['vfournisseur'].lower().strip()
                    if df['Fournisseur'][4] == 'Ville':
                        ville_fourn_value = df.iloc[4]['vfournisseur'].lower().strip()
                    if df['Fournisseur'][5] == 'Code postal':
                        cp_fourn_value = df.iloc[5]['vfournisseur']
                    if df['Fournisseur'][6] == 'Téléphone':
                        tel_fourn_value = df.iloc[6]['vfournisseur']

                    if df['Fournisseur'][8] == 'Client':
                        if df['Fournisseur'][9] == 'Civilité':
                            civi_client_value = df.iloc[9]['vfournisseur'].lower().strip()
                        if df['Fournisseur'][10] == 'Nom':
                            l_name_client_value = df.iloc[10]['vfournisseur'].lower().strip() 
                        if df['Fournisseur'][11] == 'Prénom':
                            f_name_client_value = df.iloc[11]['vfournisseur'].lower().strip() 
                        if df['Fournisseur'][12] == 'Adresse':
                            adr_client_value = df.iloc[12]['vfournisseur'].lower().strip()
                        if df['Fournisseur'][13] == 'Adresse 2':
                            adr2_client_value = df.iloc[13]['vfournisseur'].lower().strip()
                        if df['Fournisseur'][14] == 'Ville':
                            ville_client_value = df.iloc[14]['vfournisseur'].lower().strip()
                        if df['Fournisseur'][15] == 'Code postal':
                            cp_client_value = df.iloc[15]['vfournisseur']
                        if df['Fournisseur'][16] == 'Téléphone':
                            tel_client_value = df.iloc[16]['vfournisseur']

                if pd.notna(row['Facture']):
                    if df['Facture'][1] == 'Numéro de facture':
                        num_facture = df.iloc[1]['vfacture'].strip()
                    if df['Facture'][2] == 'Date de facture':
                        date_facture = df.iloc[2]['vfacture']
                    if df['Facture'][4] == 'Échéance de paiement':
                        echeance_p_facture = df.iloc[4]['vfacture']
                    if df['Facture'][30] == 'TOTAL HT :':
                        ht_facture = df.iloc[30]['vfacture']
                    if df['Facture'][31] == 'TAUX DE TVA :':
                        tva_facture = df.iloc[31]['vfacture']     
                    if df['Facture'][32] == 'TOTAL TTC :':
                        ttc_facture = df.iloc[32]['vfacture']                   
                
            facture_instance = facture_instances.filter(num_facture=num_facture).first()
            fournisseur_instance = fournisseur_instances.filter(siret_fourn=siret_fourn_value).first()
            ville_client = ville_instances.filter(nom_ville=ville_client_value).first()
            client_nom_instances = client_instances.filter(nom_client=l_name_client_value).all()
            client_prenom_instances = client_nom_instances.filter(prenom_client=f_name_client_value).all()
            client_instance = client_prenom_instances.filter(ville=ville_client).first()
            devise_instance = devise_instances.filter(symb_devise= currency_symbol).first()
            user_instance = user_instances.get(id=user_id)
            ttc_facture_calculated = ht_facture * (1 + tva_facture)
            tolerance = 0.1

            if abs(ttc_facture_calculated - ttc_facture) < tolerance:
                    messages.success(request, 'Le total TTC a été vérifié')
            else:
                error_message = (
                    f"Le total TTC ne correspond pas au calcul. Veuillez vérifier les valeurs.\n"
                    f"Valeur attendue : {ttc_facture_calculated}\n"
                    f"Valeur réelle : {ttc_facture}"
                )
                messages.error(request, error_message)  
            if not fournisseur_instance:
                ville_fourn = ville_instances.filter(nom_ville=ville_fourn_value).first()                   
                fournisseur_instance = Fournisseur.objects.create(siret_fourn=siret_fourn_value, r_social_fourn=r_social_fourn_value, adr_fourn=adr_fourn_value, adr2_fourn=adr2_fourn_value, ville=ville_fourn, tel_fourn=tel_fourn_value)
                messages.success(request, 'Le fournisseur a été ajouté')         
            if not client_instance:  
                civi_instance = civi_instances.filter(abbr_civi=civi_client_value).first()                  
                client_instance = Client.objects.create(civilite=civi_instance, nom_client=l_name_client_value, prenom_client=f_name_client_value, adr_client=adr_client_value, adr2_client=adr2_client_value, ville=ville_client, tel_client=tel_client_value)
                messages.success(request, 'Le client a été ajouté')   
            if client_instance and client_instance.adr_client != adr_client_value: 
                messages.warning(request, 'L\'adresse du client diffère de celle dans la base de données.')   
                context['adresse_differe'] = True
                context['id_client']=client_instance.id_client
                context['old_adr'] = client_instance.adr_client
                context['new_adr'] = adr_client_value
            else:
                context['adresse_differe'] = False
            if facture_instance:
                messages.error(request, 'Cette facture existe déjà.')                                                                         
            else :
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
                
                debut_echeance = echeance_p_facture.strftime("%Y-%m-%d") + " 08:00"
                fin_echeance = echeance_p_facture.strftime("%Y-%m-%d") + " 09:00"
                agenda_event = AgendaEvent.objects.create(
                title="Echéance",
                num_facture=str(num_facture),
                description=f"La facture {num_facture} doit être acquittée ce jour.",
                start_datetime = datetime.strptime(debut_echeance, "%Y-%m-%d %H:%M"),
                end_datetime=datetime.strptime(fin_echeance, "%Y-%m-%d %H:%M"),
                user_id=user_id
                )
                messages.success(request, 'Import de la facture réussie.')
        except Exception as e:
            error_message = f"Erreur lors de l'import: {str(e)}"
            messages.error(request,  error_message)
        else:
            form = FactureImportForm()
        return render(request, 'logifacturapp/import_facture.html', {'form': form,  'context':context})
