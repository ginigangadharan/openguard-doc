## Static files

- use `{% static %}` tag

1. in `settings.py`, confirm below

```python
INSTALLED_APPS = [
    .
    .
    'django.contrib.staticfiles',
.
.
# find the static file section
STATIC_URL = 'static/'
```

2. Create `app/static/app1` directory
3. Update `prokect3/app1/templates/app1/example.html`

```html
{% extends 'base.html' %}
<!-- use 'app1:base.html'if you want to extends the base from same app.-->

{% load static %}
<!-- Remember to restart server to take effect-->

{% block content%}
Actual content for content.html
<img src="{% static 'app1/django.jpg' %}" alt="Django JPG">

{% endblock %}
```
