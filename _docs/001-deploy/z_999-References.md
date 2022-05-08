```shell
$ git clone git@github.com:ginigangadharan/django-markdown-editor.git

## update requirements.txt
## Gunicorn: gunicorn is an HTTP server. We’ll use it to serve the application inside the Docker container.
## Martor: Martor is Markdown plugin for Django
$ echo martor >> requirements.txt
$ echo gunicorn >> requirements.txt

## install librs
$ pip install -r requirements.txt

## migrate app
$ python manage.py makemigrations
$ python manage.py migrate

## Testing in Django
## follow doc


```
