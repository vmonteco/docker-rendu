from django import forms
from main.models import Citation

class CitationForm(forms.ModelForm):
    class Meta:
        model = Citation
        fields = ['text', 'author']
