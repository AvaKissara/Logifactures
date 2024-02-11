from django.urls import path
from . import views
from .views import IndexView
from .views import DetailView
from .views import ImportFactureView

app_name = "logifacturapp"

urlpatterns = [
    # path("<int:devise_id>/", views.detail, name="detail"),
     path('import-facture/', ImportFactureView.as_view(), name='import_facture'),
    path("<int:pk>/", DetailView.as_view(), name="detail"),
    path('', IndexView.as_view(), name='index'),
    # path("", views.index, name="index"),
]