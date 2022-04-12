
How to print debug messages to the Django console

https://www.linuxtut.com/en/7716c6e46338768467eb/


## Python break not working - fix it

## date time 
- fixed

adjusted timezone in reports


```html
<!-- for timezone-->
{% load tz %}

                  {% timezone "Asia/Singapore" %}
                  {{ incident.incident_time }}
                  {% endtimezone %}
```