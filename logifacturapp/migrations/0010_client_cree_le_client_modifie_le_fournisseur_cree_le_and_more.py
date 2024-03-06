# Generated by Django 5.0.2 on 2024-03-06 16:26

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('logifacturapp', '0009_alter_facture_num_facture'),
    ]

    operations = [
        migrations.AddField(
            model_name='client',
            name='cree_le',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='client',
            name='modifie_le',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='fournisseur',
            name='cree_le',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='fournisseur',
            name='modifie_le',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='fournisseur',
            name='siret_fourn',
            field=models.CharField(db_index=True, max_length=14, unique=True),
        ),
    ]