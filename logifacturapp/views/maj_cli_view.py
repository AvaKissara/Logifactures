from django.views.generic.edit import UpdateView
from django.http import JsonResponse
from django.urls import reverse_lazy
from ..models import Client
from ..forms import ClientForm

class MajClientView(UpdateView):
    model = Client
    form_class = ClientForm
    template_name = 'logifacturapp/ajout_facture.html' 
    success_url = reverse_lazy('logifacturapp:ajout_facture') 

    def form_valid(self, form):
        user = self.request.user
        form.instance.user = user
        return super().form_valid(form)

    def form_invalid(self, form):
        return JsonResponse({'success': False, 'errors': form.errors})

    def get_queryset(self):
        return Client.objects.filter(user=self.request.user)
    