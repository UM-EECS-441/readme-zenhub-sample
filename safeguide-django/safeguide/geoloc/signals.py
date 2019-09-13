from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from geoloc import models


@receiver(post_save, sender=models.Event)
def event_cache_post_save(sender, instance, **kwargs):
    models.Event.recache()


@receiver(post_delete, sender=models.Event)
def event_cache_post_delete(sender, instance, **kwargs):
    models.Event.recache()


@receiver(post_save, sender=models.Area)
def area_cache_post_save(sender, instance, **kwargs):
    models.Area.recache()


@receiver(post_delete, sender=models.Area)
def area_cache_post_delete(sender, instance, **kwargs):
    models.Area.recache()


@receiver(post_save, sender=models.GeoNode)
def index_post_save(sender, instance, **kwargs):
    instance.update_index()


@receiver(post_delete, sender=models.GeoNode)
def index_post_delete(sender, instance, **kwargs):
    instance.remove_index()
