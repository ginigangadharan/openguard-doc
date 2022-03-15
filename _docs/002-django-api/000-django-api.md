
https://github.com/codingforentrepreneurs/Django-Rest-Framework-Tutorial


## Object-Relational Mapper (ORM)

[An introduction to the Django ORM](https://opensource.com/article/17/11/django-orm)
[Build a REST API in 30 minutes with Django REST Framework](https://medium.com/swlh/build-your-first-rest-api-with-django-rest-framework-e394e39a482c)

- [Rest API Guide](https://www.bezkoder.com/django-rest-api/#1_Technology)

## Serialization

Serialization is the process of converting a Model to JSON. Using a serializer, we can specify what fields should be present in the JSON representation of the model.

## Sample curl request

```shell
root@Ubuntu-20-CP:~# curl -X POST http://192.168.56.1:8000/app/api/nodes/managednodes/ -H "Content-Type: application/json" -d '{"instance_name": "node66","instance_name_connection": "node66.lab.local","instance_credential": "test55"}'


$ curl -X POST http://192.168.56.1:8000/app/api/incident_report/ -H "Content-Type: application/json" -d '{"time":"2022-03-03T21:22:00Z","priority":"low","rule":"newrule","output":"test outputnew"}'
```

## Change branding on REST API page

Read: https://www.django-rest-framework.org/topics/browsable-api/#customizing

- create `templates/rest_framework` directory
- 
## Appendix

- [How to set/get a list type query param in Django Rest Framework](https://lucyeun95.medium.com/how-to-set-get-a-list-type-query-param-in-django-rest-framework-831f30476111)
- [How to Save Extra Data to a Django REST Framework Serializer](https://simpleisbetterthancomplex.com/tutorial/2019/04/07/how-to-save-extra-data-to-a-django-rest-framework-serializer.html)