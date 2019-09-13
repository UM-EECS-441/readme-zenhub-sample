import os, django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "safeguide.settings")
django.setup()

from datetime import datetime
import csv
import json
from geoloc.signals import index_post_delete
from geoloc.models import *
from django.contrib.gis.geos import Point
from itertools import islice
from django.db.models.signals import post_save, post_delete


def gen_event(classf):
    sev = json.loads(open(classf).read()).values()

    store = {}
    for city in sev:
        for k, v in city.items():
            store[k] = v
'''
This dictionary helps convert certain unmentioned variables to standard ones in both datasets
'''
    sanitized = {
        "NON-CRIMINAL (SUBJECT SPECIFIED)": "NON-CRIMINAL",
        "NON - CRIMINAL": "NON-CRIMINAL",
        "OTHER NARCOTIC VIOLATION": "NARCOTICS",
        "CONCEALED CARRY LICENSE VIOLATION": "WEAPONS VIOLATION",
        "MOTOR VEHICLE THEFT": "AUTO THEFT",
        "LARCENY FROM AUTO": "AUTO THEFT",
        "ROBBERY - STREET": "LARCENY",
        "ROBBERY - COMMERCIAL": "THEFT",
        "ROBBERY - CARJACKING": "AUTO THEFT",
        "ROBBERY - RESIDENCE": "BURGLARY",
        "ASSAULT BY THREAT": "AGG. ASSAULT"
    }

    classes = set()
    for k, v in store.items():
        if k not in sanitized:
            classes.add(k)
        else:
            classes.add(sanitized[k])

    Event.objects.bulk_create(
        Event(name=event_name, score=1) for event_name in classes)

    events = dict((event.name, event) for event in Event.objects.all())

    res = dict()
    for k, v in store.items():
        if k not in sanitized:
            res[k] = events[k]
        else:
            res[k] = events[sanitized[k]]

    return res


def gen_crimes(classes, crimef):
    reader = csv.DictReader(open(crimef))
    agg = 0
    for idx, row in enumerate(reader):
        if row['crime_class'] not in classes:
            print('Error')
            continue

        try:
            yield GeoNode(
                event=classes[row['crime_class']],
                event_date=datetime.strptime(row['timestamp'][:-6],
                                             '%Y-%m-%dT%H:%M:%S'),
                location=Point(float(row['lon']), float(row['lat'])))
        except ValueError:
            agg += 1
            print('{} - {}'.format(crimef, idx))
            continue

    print('{} - {} errors'.format(crimef, agg))


def main():
    print('Running script...')

    print('Disconnecting...')
    post_delete.disconnect(index_post_delete, sender=GeoNode)

    Event.objects.all().delete()
    GeoNode.objects.all().delete()

    CLASS_PATH = os.environ.get('CLASS_PATH', '')
    BC_PATH = os.environ.get('BC_PATH', '')
    CHI_PATH = os.environ.get('CHI_PATH', '')

    if not (CLASS_PATH and BC_PATH and CHI_PATH):
        print('Environment is missing!')
        return

    classes = gen_event(CLASS_PATH)
    GeoNode.objects.bulk_create(gen_crimes(classes, BC_PATH))

    batch_size = 100
    chi_nodes = gen_crimes(classes, CHI_PATH)
    while True:
        batch = list(islice(chi_nodes, batch_size))
        if not batch:
            break
        GeoNode.objects.bulk_create(batch, batch_size)


if __name__ == '__main__':
    main()
