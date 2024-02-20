from django.urls import path
from . import views
from .views import IndexView, ListeFactureView, ListeFournisseurView, DetailView, ImportFactureView, DeleteFactureView, ListeClientView

app_name = "logifacturapp"

urlpatterns = [
    path('import-facture/', ImportFactureView.as_view(), name='import_facture'),
    path("<int:pk>/", DetailView.as_view(), name="detail"),
    path('', IndexView.as_view(), name='index'),
    path('facture/delete/<int:facture_id>/', DeleteFactureView.as_view(), name='delete_facture'),
    path('facture/liste_facture/', ListeFactureView.as_view(), name='liste_facture'),
    path('liste_fournisseur/', ListeFournisseurView.as_view(), name='liste_fournisseur'),
    path('liste_client/', ListeClientView.as_view(), name='liste_client'),
]