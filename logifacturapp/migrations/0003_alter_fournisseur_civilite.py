# Generated by Django 5.0.2 on 2024-02-16 15:10

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('logifacturapp', '0002_alter_methode_paiement_table'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fournisseur',
            name='civilite',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='logifacturapp.civilite'),
        ),
    ]
