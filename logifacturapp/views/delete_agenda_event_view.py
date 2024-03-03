from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.views import View
from ..models import AgendaEvent

@method_decorator(csrf_exempt, name='dispatch')
class DeleteAgendaEventView(View):
    @method_decorator(require_POST)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)

    def post(self, request, *args, **kwargs):
        event_id = request.POST.get('event_id')

        try:
            agenda_event = AgendaEvent.objects.get(id=event_id)
            agenda_event.delete()
            response_data = {'success': True, 'message': 'Événement supprimé avec succès.'}
        except AgendaEvent.DoesNotExist:
            response_data = {'success': False, 'message': 'Événement non trouvé.'}

        return JsonResponse(response_data)
