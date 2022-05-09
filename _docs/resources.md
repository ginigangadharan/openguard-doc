---
title: Resources and References
tags:
 - reference
 - resource
 - learning
description: Resources and References
---

# Resources and References

## Python Django

- [Dockerizing a Python Django Web Application](https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application)
- [Dockerizing Django with Postgres, Gunicorn, and Nginx](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)
- [Get Started With Django Part 1: Build a Portfolio App](https://realpython.com/get-started-with-django-1/)
- [Securely Deploy a Django App With Gunicorn, Nginx, & HTTPS](https://realpython.com/django-nginx-gunicorn/#making-your-site-production-ready-with-https)
- [How to Use Bootstrap 4 Forms With Django](https://simpleisbetterthancomplex.com/tutorial/2018/08/13/how-to-use-bootstrap-4-forms-with-django.html)

## Django API

- [An introduction to the Django ORM](https://opensource.com/article/17/11/django-orm)
- [Build a REST API in 30 minutes with Django REST Framework](https://medium.com/swlh/build-your-first-rest-api-with-django-rest-framework-e394e39a482c)
- [Rest API Guide](https://www.bezkoder.com/django-rest-api/#1_Technology)

## Django REST API Token

- [Token Based Authentication for Django Rest Framework](https://medium.com/quick-code/token-based-authentication-for-django-rest-framework-44586a9a56fb)
- [How to Implement Token Authentication using Django REST Framework](https://simpleisbetterthancomplex.com/tutorial/2018/11/22/how-to-implement-token-authentication-using-django-rest-framework.html)

```shell
## Create Token
./manage.py drf_create_token <username>

## regenerate token
./manage.py drf_create_token -r <username>
```

## Django Pagination

- [How to Paginate with Django](https://simpleisbetterthancomplex.com/tutorial/2016/08/03/how-to-paginate-with-django.html)

## Ansible Runner

- [Using Runner as a Python Module Interface to Ansible](https://ansible-runner.readthedocs.io/en/stable/python_interface/#)
- [Running with Ansible Runner](https://swapps.com/blog/go-beyond-with-automation-ansible-runner)
- [Ansible Runner Examples](https://programtalk.com/python-examples/ansible.runner.Runner/)
- [how to use ansible runner programatically](https://gist.github.com/privateip/879683a0172415c408fb2afb82a97511)

```shell
ansible-runner -p my_playbook.yml run /path/to/my/project
```

```python
import ansible_runner
r = ansible_runner.run(private_data_dir='/tmp/demo', playbook='test.yml')
print("{}: {}".format(r.status, r.rc))
# successful: 0
for each_host_event in r.events:
    print(each_host_event['event'])
print("Final status:")
print(r.stats)
```

### Passing inventory to ansible runner

The ansible_runner.run() accepts following values for inventory parameter.

1. Path to the inventory file in the private_data_dir
2. Native python dict supporting the YAML/json inventory structure
3. A text INI formatted string
4. A list of inventory sources, or an empty list to disable passing inventory

Default value, if not passed, for this parameter is private_data_dir/inventory directory. Passing this parameter overrides the inventory directory/file.

