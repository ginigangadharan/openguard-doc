---
title: Troubleshooting
tags:
 - troubleshooting
description: Troubleshooting
---

# Troubleshooting

## Database tables missing

```shell
python manage.py migrate --fake app_name zero 
python manage.py migrate app_name
```

## Run developement server on different port or IP

```
$ python manage.py runserver 192.168.56.1:8000
## or
$ python manage.py runserver 0.0.0.0:8000
```

## Change system timezone 

Ubuntu:

```shell
root@Ubuntu-20-CP:~# systemctl enable systemd-timesyncd.service
root@Ubuntu-20-CP:~# systemctl start systemd-timesyncd.service

sudo dpkg-reconfigure tzdata
```