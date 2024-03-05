from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.views import View
from ..models import AgendaEvent
import json

class DetailEvenementView(View):
    def get(self, request, *args, **kwargs):       
        pk = kwargs.get('pk')

        event = AgendaEvent.objects.get(id=pk)  
        event_details = {
            'id': event.id,
            'title': event.title,
            'description': event.description,
            'start_datetime': event.start_datetime,
            'end_datetime':event.end_datetime,
        }
        return JsonResponse(event_details)
    
    def post(self, request, pk):
        data = request.POST 
        event = get_object_or_404(AgendaEvent, id=pk)
        event.title = data['title']
        event.description = data['description']
        event.start_datetime = data['start_datetime']
        event.end_datetime = data['end_datetime']
        event.save()
        return JsonResponse({'message': 'Événement mis à jour avec succès'})

