from geoloc import serializers
from geoloc.tests.utils import StubbedObjectsTestCase


class EventSerializerTestCase(StubbedObjectsTestCase):
    def setUp(self):
        super(EventSerializerTestCase, self).setUp()
        self.serializer = serializers.EventSerializer(
            instance=self.burglary_event)

    def test_event_serialization(self):
        data = self.serializer.data
        self.assertEqual(set(data.keys()), {'event_id', 'name', 'score'})


class GeoNodeSerializerTestCase(StubbedObjectsTestCase):
    def setUp(self):
        super(GeoNodeSerializerTestCase, self).setUp()
        self.serializer = serializers.GeoNodeSerializer(
            instance=self.burglary_geonode)

    def test_geonode_serialization(self):
        data = self.serializer.data
        self.assertEqual(
            set(data.keys()), {
                'geonode_id', 'event', 'description', 'timestamp', 'latitude',
                'longitude'
            })
