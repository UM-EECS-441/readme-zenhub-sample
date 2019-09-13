from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from django.utils import timezone
from django.contrib.gis.geos import Point
from geoloc import models
import random
from datetime import timedelta


def ann_arbor_loc():
    lat, lon = 42.275277, -83.738314
    return Point(lon, lat)


def random_date():
    int_delta = 5 * 365 * 24 * 60 * 60
    random_second = random.randrange(int_delta)
    return timezone.now() - timedelta(seconds=random_second)


def random_loc():
    aa_loc = ann_arbor_loc()
    lat, lon = aa_loc.y, aa_loc.x
    lat *= random.uniform(1 - 0.0001, 1 + 0.0001)
    lon *= random.uniform(1 - 0.0001, 1 + 0.0001)
    return Point(lon, lat)


class Command(BaseCommand):
    help = 'Build data for front-end development'

    def add_arguments(self, parser):
        parser.add_argument(
            'action',
            nargs='+',
            choices={'superuser', 'events', 'geonodes', 'areas'},
            help='Data store to build indices')

    def handle(self, *args, **options):
        if 'superuser' in options['action']:
            self._create_superuser()

        if 'areas' in options['action']:
            self._create_areas()

        if 'events' in options['action']:
            self._create_events()

        if 'geonodes' in options['action']:
            self._create_geonodes()

    @staticmethod
    def _create_superuser():
        print("Creating superuser...")
        User = get_user_model()
        User.objects.create_superuser('safeguide', 'safeguide@umich.edu',
                                      'staysafe')

    @staticmethod
    def _create_areas():
        print("Creating areas...")
        models.Area.objects.create(name="Ann Arbor", location=ann_arbor_loc())

    @staticmethod
    def _create_events():
        print("Creating events...")
        events_examples = """
            Murder
            Manslaughter
            Mayhem
            Common assault aka assault
            Battery
            Assault with intent to rob
            Assault with intent to rape
            Kidnapping / abduction
            Rape
        """

        for event_name in events_examples.splitlines():
            event_name = event_name.strip()

            if event_name:
                models.Event.objects.create(
                    name=event_name.strip(), score=random.random())

    @staticmethod
    def _create_geonodes():
        print("Creating geonodes...")
        events = models.Event.objects.all()

        for i in range(100):
            event = random.choice(events)
            models.GeoNode.objects.create(
                event=event,
                description="GeoNode #{id}".format(id=i),
                event_date=random_date(),
                location=random_loc())
