from django.urls import path
from . import views
from .views import IndexView, ListeFactureView, ChangeStatutFactureView,AddFournisseurView, GetClientsView, GetFournisseursView, AddClientView, ListeFournisseurView, DetailView, ImportFactureView, ImportFactureMajClientView, CreateFactureView, DeleteFactureView, ListeClientView, AgendaEventView, CreeAgendaEventView, DeleteAgendaEventView, DetailEvenementView

app_name = "logifacturapp"

urlpatterns = [
    path('import-facture/', ImportFactureView.as_view(), name='import_facture'),
    path('import-facture/mise_a_jour/client/<int:pk>/', ImportFactureMajClientView.as_view(), name='import_facture_maj_client'),
    path("facture/liste_facture/<int:pk>/", DetailView.as_view(), name="detail"),
    path('', IndexView.as_view(), name='index'),
    path('facture/create/', CreateFactureView.as_view(), name='ajout_facture'),
    path('facture/create/nouveau-fournisseur/', AddFournisseurView.as_view(), name='ajout_fournisseur'),
    path('facture/create/fournisseurs/', GetFournisseursView.as_view(), name='get_fournisseurs'),
    path('facture/create/clients/', GetClientsView.as_view(), name='get_clients'),
    path('facture/create/nouveau-client/', AddClientView.as_view(), name='ajout_client'),
    path('facture/delete/<int:facture_id>/', DeleteFactureView.as_view(), name='delete_facture'),
    path('facture/liste_facture/', ListeFactureView.as_view(), name='liste_facture'),
    path('facture/liste_facture/change_statut_facture/<int:pk>/', ChangeStatutFactureView.as_view(), name='change_statut_facture'),
    path('liste_fournisseur/', ListeFournisseurView.as_view(), name='liste_fournisseur'),
    path('liste_client/', ListeClientView.as_view(), name='liste_client'),
    path('calendrier/', AgendaEventView.as_view(), name='calendrier'),
    path('calendrier/mois/<int:month_number>/', AgendaEventView.as_view(), name='calendrier_mois'),
    path('calendrier/jour/<int:month_number>/<int:day_number>/', AgendaEventView.as_view(), name='calendrier_jour'),
    path('calendrier/cree_evenement', CreeAgendaEventView.as_view(), name='cree_agenda_event'),
    path('calendrier/supprimer_evenement/', DeleteAgendaEventView.as_view(), name='supprimer_agenda_event'),
    path("calendrier/<int:pk>/", DetailView.as_view(), name="detail_f_calendrier"),
    path('calendrier/details_evenement/<int:pk>/', DetailEvenementView.as_view(), name='details_evenement'),
]