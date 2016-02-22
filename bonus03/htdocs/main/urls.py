from django.conf.urls import url
from django.conf.urls import patterns

urlpatterns = patterns('main.views',
    url(r'^$', 'main'),
    url(r'^add/$', 'add'),
)
