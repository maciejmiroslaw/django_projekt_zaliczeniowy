# Generated by Django 4.1.5 on 2023-01-26 22:13

from django.db import migrations
import django_resized.forms


class Migration(migrations.Migration):

    dependencies = [
        ('apka', '0003_imagemodel'),
    ]

    operations = [
        migrations.AddField(
            model_name='imagemodel',
            name='cropped',
            field=django_resized.forms.ResizedImageField(crop=['middle', 'center'], default='default_croped.jpg', force_format=None, keep_meta=True, quality=-1, scale=None, size=[100, 100], upload_to='cropped'),
        ),
        migrations.AlterField(
            model_name='imagemodel',
            name='image',
            field=django_resized.forms.ResizedImageField(crop=['middle', 'center'], default='default.jpg', force_format=None, keep_meta=True, quality=-1, scale=None, size=[1000, 1000], upload_to='full'),
        ),
    ]
