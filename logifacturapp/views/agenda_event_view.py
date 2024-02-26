from django.shortcuts import render
from django.views import View
from ..models import AgendaEvent
from datetime import date, timedelta, datetime


class AgendaEventView(View):
    model = AgendaEvent
    template_name = 'logifacturapp/calendrier.html'

    def get(self, request, *args, **kwargs):
        # events = AgendaEvent.objects.all()

        month_number = kwargs.get('month_number')

        current_date = datetime.now().strftime('%A %d %B')
        today = date.today()
        if month_number is None:
            first_day_of_month = today.replace(day=1)
            last_day_of_month = today.replace(month=today.month % 12 + 1, day=1) - timedelta(days=1)
        else:
            first_day_of_month = today.replace(month=month_number, day=1)
            last_day_of_month = today.replace(month=month_number % 12 + 1, day=1) - timedelta(days=1)

        days_of_month = [first_day_of_month + timedelta(days=x) for x in range((last_day_of_month - first_day_of_month).days + 1)]
        
        events = AgendaEvent.objects.filter(end_datetime__gte=first_day_of_month, start_datetime__lte=last_day_of_month)
        event_dates = [event.end_datetime.date() for event in events]

        months = [
            {'name': 'Jan', 'value': 1, 'selected': first_day_of_month.month == 1},
            {'name': 'Fev', 'value': 2, 'selected': first_day_of_month.month == 2},
            {'name': 'Mar', 'value': 3, 'selected': first_day_of_month.month == 3},
            {'name': 'Avr', 'value': 4, 'selected': first_day_of_month.month == 4},
            {'name': 'Mai', 'value': 5, 'selected': first_day_of_month.month == 5},
            {'name': 'Jui', 'value': 6, 'selected': first_day_of_month.month == 6},
            {'name': 'Jul', 'value': 7, 'selected': first_day_of_month.month == 7},
            {'name': 'Aou', 'value': 8, 'selected': first_day_of_month.month == 8},
            {'name': 'Sep', 'value': 9, 'selected': first_day_of_month.month == 9},
            {'name': 'Oct', 'value': 10, 'selected': first_day_of_month.month == 10},
            {'name': 'Nov', 'value': 11, 'selected': first_day_of_month.month == 11},
            {'name': 'Dec', 'value': 12, 'selected': first_day_of_month.month == 12}
        ]

        days_of_week = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim']

        context = {'events': events, 'events_date':event_dates,'days_of_month': days_of_month, 'months': months, 'days_of_week': days_of_week, 'current_date': current_date}
        return render(request, self.template_name, context)