# Generated by Django 4.1.3 on 2023-02-27 17:36

from django.db import migrations, models

import users.models


class Migration(migrations.Migration):

    dependencies = [
        ("users", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="userprofile",
            name="settings",
            field=models.JSONField(
                blank=True,
                default=users.models.default_profile_settings,
                verbose_name="Settings",
            ),
        ),
    ]
