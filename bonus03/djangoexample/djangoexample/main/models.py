from django.db import models

# Create your models here.
class Citation(models.Model):
    author = models.CharField(max_length = 100)
    text = models.TextField()

    def __unicode__(self):
        return (u"%s" % (self.title[0:15]))

    def __str__(self):
        return (u"%s" % (self.title[0:15]))
