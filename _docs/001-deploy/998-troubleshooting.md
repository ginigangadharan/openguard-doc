## If database tables missing

```shell
python manage.py migrate --fake app_name zero 
python manage.py migrate app_name
```

## Run developement server on different port or IP

```
$ python manage.py runserver 192.168.56.1:8000
```