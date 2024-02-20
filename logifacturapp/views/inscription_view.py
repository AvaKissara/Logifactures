from django.contrib.auth import login
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from ..forms import SignUpForm


class InscriptionView(CreateView):
    form_class = SignUpForm
    template_name = 'auth/signup.html'
    success_url = reverse_lazy('logifacturapp:index')

    def form_valid(self, form):
        response = super().form_valid(form)
        login(self.request, self.object)
        return response
