- [How to setup a cron job in Django](https://gutsytechster.wordpress.com/2019/06/24/how-to-setup-a-cron-job-in-django/)

```shell
pip install django-crontab


## enable app in settings
INSTALLED_APPS = [
    'django_crontab',

## add cron job in settings


```


- [Django Background Tasks](https://django-background-tasks.readthedocs.io/en/latest/)
- [Django Q](https://django-q.readthedocs.io/en/latest/)


## Django with Celery

```shell
$ pip install celery==3.1.18
$ pip freeze > requirements.txt
```

[Sample Celery Project](https://github.com/bennett39/celery39/tree/celery-start)

Update `project/openguard/__Init__.py`

```python
from __future__ import absolute_import, unicode_literals

# This will make sure the app is always imported when
# Django starts so that shared_task will use this app.
from .celery import app as celery_app

__all__ = ('celery_app',)
```


## Django ASYNC

https://www.crowdbotics.com/blog/how-django-currently-handles-asynchronous-views

What is ASGI?

ASGI stands for Asynchronous Server Gateway Interface. It is the asynchronous follow-up to Web Server Gateway Interface (WSGI), and ASGI provides a standard for creating asynchronous Python-based web apps. While Async Views do work under WSGI, running an async view in a WSGI application does not provide concurrency when calling a view from outside.

To resolve this, let's test an example that is concurrently callable from the outside. Begin by installing an ASGI server using uvicorn, which is a single-threaded server. Next, change the runserver command to run the Django application as an ASGI instead of WSGI.

## DJANGO ASYNCHRONOUS TASKS WITHOUT CELERY

[DJANGO ASYNCHRONOUS TASKS WITHOUT CELERY](https://www.guguweb.com/2019/11/21/django-asynchronous-tasks-without-celery/)

