from django.conf.urls import include, url
from django.contrib import admin
from django.conf.urls import patterns

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'djangoexample.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^', include('main.urls')),
    url(r'^admin/', include(admin.site.urls)),
)
