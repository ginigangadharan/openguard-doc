---
title: Dockerizing Django App
tags:
 - docker
 - container
 - podman
description: Dockerizing Django App
---

# Dockerizing Django App

## Create the `Dockerfile`

```python
# syntax=docker/dockerfile:1
# syntax=docker/dockerfile:1
FROM python:3

## PYTHONDONTWRITEBYTECODE: Prevents Python from 
##   writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE=1

## PYTHONUNBUFFERED: Prevents Python from 
##   buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED=1

# install dependencies
RUN pip install --upgrade pip
WORKDIR /code/
COPY requirements.txt /code/
RUN pip install -r requirements.txt

RUN mkdir -pv /var/log/gunicorn/ \
    && mkdir -pv /var/run/gunicorn/

COPY . .

EXPOSE 8000

CMD ["gunicorn", "-c", "config/gunicorn/dev.py"]
```

## Create the `requirements.txt`

```python
Django>=4.0
psycopg2>=2.8
gunicorn>=20
djangorestframework
django-cors-headers
django-jsonfield

ansible_runner
ansible-core>==2.12

django-crispy-forms
crispy_bootstrap5
```

## Create `docker-compose.yml`

For local development with Docker containers.

```yaml
version: "3.9"
   
services:
  db:
    image: postgres
    volumes:
      - ./data/db:/var/lib/postgresql/data
    environment:
      - POSTGRES_NAME=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
  web:
    #build: .
    image: "localhost/openguard"
    container_name: openguard
    command: python manage.py runserver 0.0.0.0:8000
    restart: always
    volumes:
      - openguard_data:/code
    ports:
      - "8000:8000"
    environment:
      - POSTGRES_NAME=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
    env_file:
      - ./.env.dev
    depends_on:
    #  - db
```

## Build the image

```shell
## podman build -t IMAGE_NAME .
$ podman build -t openguard .
```

## Preparing the Django project

```shell
## switch to project directory
$ cd 
openguard-app $ podman-compose run web django-admin startproject composeexample .
```

## Connect the database

```python
# settings.py
   
import os
   
[...]
   
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}
```