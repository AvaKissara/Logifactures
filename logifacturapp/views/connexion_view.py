from django.contrib.auth.views import LoginView
from django.shortcuts import redirect

class ConnexionView(LoginView):
    template_name = 'auth/login.html'

    def get_success_url(self):
        next_url = self.request.GET.get('next', None)
        if next_url:
            return next_url
        
        return '/'

    def form_valid(self, form):
        response = super().form_valid(form)

        return response
