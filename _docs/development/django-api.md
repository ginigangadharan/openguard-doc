---
title: Django API
tags:
 - API
 - Django
description: Django API
---

# Django API

## Object-Relational Mapper (ORM)

[An introduction to the Django ORM](https://opensource.com/article/17/11/django-orm)
[Build a REST API in 30 minutes with Django REST Framework](https://medium.com/swlh/build-your-first-rest-api-with-django-rest-framework-e394e39a482c)

- [Rest API Guide](https://www.bezkoder.com/django-rest-api/#1_Technology)

## Serialization

Serialization is the process of converting a Model to JSON. Using a serializer, we can specify what fields should be present in the JSON representation of the model.

## Sample curl request

```shell
root@Ubuntu-20-CP:~# curl -X POST http://192.168.56.1:8000/app/api/nodes/managednodes/ -H "Content-Type: application/json" -d '{"instance_name": "node66","instance_name_connection": "node66.lab.local","instance_credential": "test55"}'


$ curl -X POST http://192.168.56.1:8000/api/incident_report/?source_hostname=$HOSTNAME -H "Content-Type: application/json" -d '{"time":"2022-03-16T05:45:57.483251Z","priority":"Critical","rule":"FALCO_OGRULE_DIR_TMP","output":"05:45:57.483251536: Critical Permission or ownership changed for /tmp (user=root command=chmod 1644 /tmp/ file=<NA> parent=bash pcmdline=bash gparent=sudo)"}'

```

## Change branding on REST API page

Read: https://www.django-rest-framework.org/topics/browsable-api/#customizing

- create `templates/rest_framework` directory




## Fix Job API

http://192.168.56.1:8000/api/incident_fix/ - can access from browser

## REST API Token

- [Token Based Authentication for Django Rest Framework](https://medium.com/quick-code/token-based-authentication-for-django-rest-framework-44586a9a56fb)
- [How to Implement Token Authentication using Django REST Framework](https://simpleisbetterthancomplex.com/tutorial/2018/11/22/how-to-implement-token-authentication-using-django-rest-framework.html)


Create Token

`./manage.py drf_create_token <username>`

regenerate token

`./manage.py drf_create_token -r <username>`

```shell
$ python manage.py drf_create_token username

$ python manage.py drf_create_token admin
Generated token c48b2d2bab41c9bf17c1bf2ecREMOVED for user admin
$ python manage.py drf_create_token operator
Generated token a7fdcd30f90350dafa260ed1bfREMOVED for user operator
```

### Disable Token auth for some views

Disable auth for class based views

```python
class HelloView(APIView):
    authentication_classes = [] #disables authentication
    permission_classes = [] #disables permission
.
.
```

Enable auth for class based views

```python
class HelloView(APIView):
    permission_classes = (IsAuthenticated,)  
.
.
```

Disable auth for function based views

```python
@api_view(['GET', 'POST', 'DELETE'])
@authentication_classes([])
@permission_classes([])
def incident_report(request):
.
.
.
```

enable auth for function based views:

```python
@api_view(['GET', 'POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def incident_fix(request):
.
.
.
```

## check API using httpie

```shell
pip install httpie
```

use `httpie`

```shell
http http://192.168.56.1:8000/api/hello/
HTTP/1.1 401 Unauthorized
Allow: GET, HEAD, OPTIONS
Content-Length: 58
Content-Type: application/json
Cross-Origin-Opener-Policy: same-origin
Date: Thu, 17 Mar 2022 12:14:33 GMT
Referrer-Policy: same-origin
Server: WSGIServer/0.2 CPython/3.9.10
Vary: Accept
WWW-Authenticate: Token
X-Content-Type-Options: nosniff
X-Frame-Options: DENY

{
    "detail": "Authentication credentials were not provided."
}


$ http http://192.168.56.1:8000/api/hello/ 'Authorization: Token YOUR_TOKEN_STRING'
HTTP/1.1 200 OK
Allow: GET, HEAD, OPTIONS
Content-Length: 27
Content-Type: application/json
Cross-Origin-Opener-Policy: same-origin
Date: Thu, 17 Mar 2022 12:24:28 GMT
Referrer-Policy: same-origin
Server: WSGIServer/0.2 CPython/3.9.10
Vary: Accept
X-Content-Type-Options: nosniff
X-Frame-Options: DENY

{
    "message": "Hello, World!"
}

```

## Appendix

- [How to set/get a list type query param in Django Rest Framework](https://lucyeun95.medium.com/how-to-set-get-a-list-type-query-param-in-django-rest-framework-831f30476111)
- [How to Save Extra Data to a Django REST Framework Serializer](https://simpleisbetterthancomplex.com/tutorial/2019/04/07/how-to-save-extra-data-to-a-django-rest-framework-serializer.html)
- [codingforentrepreneurs/Django-Rest-Framework-Tutorial](https://github.com/codingforentrepreneurs/Django-Rest-Framework-Tutorial) (GitHub)