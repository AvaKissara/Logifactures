from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.views import View
from ..models import AgendaEvent 

@method_decorator(csrf_exempt, name='dispatch')
class CreeAgendaEventView(View):
    @method_decorator(require_POST)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)

    def post(self, request, *args, **kwargs):
        title = request.POST.get('title')
        description = request.POST.get('description')
        start_datetime = request.POST.get('start_datetime')
        end_datetime = request.POST.get('end_datetime')
        user_id = request.user.id

        agenda_event = AgendaEvent.objects.create(
            title=title,
            description=description,
            start_datetime=start_datetime,
            end_datetime=end_datetime,
            user_id=user_id 
        )

        response_data = {'message': 'AgendaEvent créé avec succès'}
        return JsonResponse(response_data)

