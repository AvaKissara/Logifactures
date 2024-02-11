from django.views import generic
from django.views import View
from ..models import Devise

class IndexView(generic.ListView):
    # def get(self, request):
    #     devise_list = Devise.objects.order_by("-nom_devise")
    #     context = {"devise_list":devise_list}
    #     return render(request, "logifacturapp/index.html", context)
    
    template_name="logifacturapp/index.html"
    context_object_name = "devise_list"
    def get_queryset(self):
        return Devise.objects.order_by("-nom_devise")