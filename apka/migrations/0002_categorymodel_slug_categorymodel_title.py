# Generated by Django 4.1.5 on 2023-01-26 17:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apka', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='categorymodel',
            name='slug',
            field=models.SlugField(blank=True, max_length=200, null=True, unique=True),
        ),
        migrations.AddField(
            model_name='categorymodel',
            name='title',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
