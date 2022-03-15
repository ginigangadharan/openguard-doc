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

##


## References

- [Dockerizing a Python Django Web Application](https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application)
- [Dockerizing Django with Postgres, Gunicorn, and Nginx](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)
- [Get Started With Django Part 1: Build a Portfolio App](https://realpython.com/get-started-with-django-1/)
- 