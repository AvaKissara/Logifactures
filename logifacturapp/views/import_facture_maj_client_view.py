from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.views import View
from ..models import Client

@method_decorator(csrf_exempt, name='dispatch')
class ImportFactureMajClientView(View):

    def post(self, request, pk):
        try:
            client = get_object_or_404(Client, id_client=pk)
            new_adr_client = request.POST.get('newAdrClient')

            client.adr_client = new_adr_client
            client.save()

            return JsonResponse({'message': 'Mise à jour réussie.'})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
