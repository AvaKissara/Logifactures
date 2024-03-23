from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from ..models import Client
from ..forms import ClientForm
from django.http import JsonResponse
from django.shortcuts import render

class AddClientView(CreateView):
    model = Client
    form_class = ClientForm
    template_name = 'logifacturapp/ajout_facture.html'
    success_url = reverse_lazy('logifacturapp:ajout_facture')
    
    def get(self, request, *args, **kwargs):
            form = ClientForm()
            return render(request, 'logifacturapp/ajout_facture.html', {'form': form})
    
    def post(self, request, *args, **kwargs):
        form = ClientForm(request.POST)
        if form.is_valid():
            user = self.request.user
            form.instance.user = user
            client = form.save()

        return JsonResponse({'success': True})