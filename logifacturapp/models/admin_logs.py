from django.db import models
from .admin import Admin

class Admin_logs(models.Model):
    id_log = models.AutoField(primary_key=True, db_column='id_log', default=None)
    admin = models.ForeignKey('Admin', on_delete=models.CASCADE)
    action = models.CharField(max_length=20)
    actualise_le = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table = 'admin_logs'