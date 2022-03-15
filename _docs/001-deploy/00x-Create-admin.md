```shell
[vagrant@fedora-34 openguard-app]$ python manage.py createsuperuser --username admin --email admin@lab.local
Password: 
Password (again): 
This password is too common.
Bypass password validation and create user anyway? [y/N]: y
Superuser created successfully.

## or 

$ python manage.py createsuperuser 
Username (leave blank to use 'vagrant'): admin
Email address: admin@openguard.local
Password: <password>
Password (again): 
This password is too common.
Bypass password validation and create user anyway? [y/N]: y
Superuser created successfully.
```