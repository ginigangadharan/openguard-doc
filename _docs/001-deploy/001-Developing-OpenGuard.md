# Developing OpenGuard

## Init project

```shell
$ django-admin startproject openguard
$ cd openguard
$ python manage.py makemigrations           
No changes detected

$ python manage.py migrate        
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying auth.0012_alter_user_first_name_max_length... OK
  Applying sessions.0001_initial... OK

```

Run app

```shell
$ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).
February 24, 2022 - 14:56:01
Django version 4.0.2, using settings 'openguard.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.
```

## Update app to take environment variables

### Create environment variable

`.env.dev` file

```shell
DEBUG=1
SECRET_KEY=foo
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]
```


### Update settings.py

```python
## settings.py
.
.
import os
.
.
.

# SECURITY WARNING: don't run with debug turned on in production!
#DEBUG = True
DEBUG = int(os.environ.get("DEBUG", default=0))

# SECURITY WARNING: keep the secret key used in production secret!
#SECRET_KEY = 'django-insecure-ibc2wkz@&a)k8-kbs74azoa5zxwd2!e4@$13f7&gv3g3rhz5rn'
SECRET_KEY = os.environ.get("SECRET_KEY")

# 'DJANGO_ALLOWED_HOSTS' should be a single string of hosts with a space between each.
# For example: 'DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]'
#ALLOWED_HOSTS = []
ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS").split(" ")
```