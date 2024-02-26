from django.contrib import admin
from .views.inscription_view import InscriptionView

from .models import Devise
admin.site.register(Devise)

from .models import(Pays)
admin.site.register(Pays)

from .models import(Cat_facture)
admin.site.register(Cat_facture)

from .models import(Civilite)
admin.site.register(Civilite)

from .models import(Client)
admin.site.register(Client)

from .models import(Cp)
admin.site.register(Cp)

from .models import(Facture)
admin.site.register(Facture)

from .models import(Fournisseur)
admin.site.register(Fournisseur)

from .models import(Methode_paiement)
admin.site.register(Methode_paiement)

from .models import(Region)
admin.site.register(Region)

from .models import(Ville)
admin.site.register(Ville)

from .models import(AgendaEvent)
admin.site.register(AgendaEvent)
