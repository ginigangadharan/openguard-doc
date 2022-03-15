# Enable login/logout

```python
# openguard/urls.py
    path('login/', include('django.contrib.auth.urls')), 
```

## Login Page
Let's make our login page! Django by default will look within a templates folder called `registration` for auth templates. The login template is called `login.html`.

Create `PROJECT_DIR/templates/registration/login.html`


```html
{% extends 'base.html' %}

{% block title %}Log In{% endblock %}

{% block content %}
<h2>Log In</h2>
<form method="post">
  {% csrf_token %}
  {{ form.as_p }}
  <button type="submit">Log In</button>
</form>
{% endblock %}
```

## Update `settings.py` about the `template` folder


```python
# config/settings.py
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

## Also add redirect URL

LOGIN_REDIRECT_URL = 'home'
LOGOUT_REDIRECT_URL = 'home'
```



## Reference

- https://learndjango.com/tutorials/django-login-and-logout-tutorial
- https://github.com/wsvincent/django-auth-tutorial