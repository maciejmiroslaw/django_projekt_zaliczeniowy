from django.contrib import admin

from apka.models import CategoryModel, Comment, ImageModel

# Register your models here.
admin.site.register(CategoryModel)
admin.site.register(ImageModel)
admin.site.register(Comment)
