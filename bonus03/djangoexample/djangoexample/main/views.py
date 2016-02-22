from django.shortcuts import render, redirect
from main.forms import CitationForm
from main.models import Citation
from django.views.decorators.csrf import csrf_protect

# Create your views here.
def main(request):
    citations = Citation.objects.all()
    return (render(request, "main/main.html", {"citations" : citations}))

@csrf_protect
def add(request):
    if (request.method == "POST"):
        form = CitationForm(request.POST)
        if form.is_valid():
            #text = form.cleaned_data['text']
            #author = form.cleaned_data['author']
            form.save()
            return (redirect(main))
        else:
            return (render(request, 'main/add.html', {"form" : form}))
    else :
        form = CitationForm()
        return (render(request, "main/add.html", {"form" : form}))
