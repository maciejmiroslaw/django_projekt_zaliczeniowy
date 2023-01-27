from django.shortcuts import render
from apka.forms import CommentForm

from apka.models import CategoryModel, Comment, ImageModel

# Create your views here.

def index(request):

    categories = CategoryModel.objects.all()

    scope = {}
    scope['categories'] = categories
    return render(request, 'index.html', scope)

def categoryView(request, slug):

    category = CategoryModel.objects.get(slug=slug)
    scope = {}
    categories = CategoryModel.objects.all()
    scope['categories'] = categories
    scope['category'] = category
    images = ImageModel.objects.filter(category=category).order_by('created')
    scope['images'] = images

    return render(request, 'category.html', scope)

def imageView(request, slug1, slug2):

    category = CategoryModel.objects.get(slug=slug1)
    image = ImageModel.objects.get(slug=slug2)
    categories = CategoryModel.objects.all()
    scope = {}
    scope['categories'] = categories
    scope['category'] = category
    scope['image'] = image
    if request.method == "POST":
        comment_form = CommentForm(data=request.POST)
        if comment_form.is_valid():
            new = comment_form.save(commit=False)
            new.image = image
            new.save()
        comment_form = CommentForm()
        scope['comment_form'] = comment_form
    else:
        scope['comment_form'] = CommentForm()

    comments = Comment.objects.all().filter(image=image).order_by('-created_on')
    scope['comments'] = comments
    return render(request, 'image.html', scope)
