from django.test import TestCase
from django.urls import reverse
from profiles.models import Profile


class TestProfiles(TestCase):
    def test_index(self):
        response = self.client.get(reverse('profiles:index'))
        assert response.status_code == 200
        assert b"<title>Profiles</title>" in response.content

    def test_profile(self):
        dataset = Profile.objects.all()
        for profile in dataset:
            response = self.client.get(reverse('profiles:profile', args=[profile.user]))
            assert response.status_code == 200
            self.assertInHTML(profile.user.username, str(response.content))
