from django.db import models
from uuid import uuid4
from django.urls import reverse
from django_resized import ResizedImageField

class CategoryModel(models.Model):

    id = models.UUIDField(primary_key=True,
                          editable=False,
                          default=uuid4)
    title = models.CharField(null=True,
                             blank=True,
                             max_length=100)
    slug = models.SlugField(max_length=200,
                            unique=True,
                            blank=True,
                            null=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("category_detail", kwargs={"slug": self.slug})


class ImageModel(models.Model):

    id = models.UUIDField(primary_key=True,
                          editable=False,
                          default=uuid4)
    name = models.CharField(null=True,
                            blank=True,
                            max_length=100)
    description = models.TextField(null=True,
                                   blank=True,
                                   max_length=10000)
    image = ResizedImageField(size=[1000, 1000], crop=['middle', 'center'], default='default.png', upload_to='full')
    cropped = ResizedImageField(size=[100, 100], crop=['middle', 'center'], default='default.pg', upload_to='cropped')
    category = models.ForeignKey(CategoryModel, null=True, blank=True, on_delete=models.CASCADE)
    slug = models.SlugField(max_length=200,
                            unique=True,
                            blank=True,
                            null=True)
    created = models.DateTimeField(blank=True, null=True)
    last_updated = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return '{}-{}'.format(self.category.title, self.name)

    def get_absolute_url(self):
        return reverse('image-detail', kwargs={'slug': self.slug})


class Comment(models.Model):


    image = models.ForeignKey(ImageModel, on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    body = models.TextField()
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['created_on']

    def __str__(self):
        return "User: {} Text: {}".format(self.name, self.body)
