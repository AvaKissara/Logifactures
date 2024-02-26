from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

class AgendaEvent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    num_facture = models.CharField(max_length=255, blank=True, null=True)
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    start_datetime = models.DateTimeField()
    end_datetime = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    
    def get_absolute_url(self):
        return reverse('detail', args=[self.num_facture])

    def __str__(self):
        return self.title
    class Meta:
        db_table = 'Agenda_Event'