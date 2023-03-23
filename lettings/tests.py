from django.test import TestCase
from django.urls import reverse
from lettings.models import Letting


class TestLettings(TestCase):
    def test_index(self):
        response = self.client.get(reverse('lettings:index'))
        assert response.status_code == 200
        assert b"<title>Lettings</title>" in response.content

    def test_letting(self):
        dataset = Letting.objects.all()
        for letting in dataset:
            response = self.client.get(reverse('lettings:letting', args=[letting.id]))
            assert response.status_code == 200
            self.assertInHTML(letting.title, str(response.content))

