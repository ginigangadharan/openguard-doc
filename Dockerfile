# syntax=docker/dockerfile:1
#FROM jekyll/jekyll:3.8
FROM jekyll/jekyll
#FROM starefossen/github-pages

## PYTHONDONTWRITEBYTECODE: Prevents Python from 
##   writing pyc files to disc (equivalent to python -B option)
#ENV PYTHONDONTWRITEBYTECODE=1

## PYTHONUNBUFFERED: Prevents Python from 
##   buffering stdout and stderr (equivalent to python -u option)
#ENV PYTHONUNBUFFERED=1

# install dependencies
#RUN pip install --upgrade pip
WORKDIR /usr/src/app/
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#USER openguard
#RUN mkdir -pv /var/log/gunicorn/ \
#    && mkdir -pv /var/run/gunicorn/
    #&& systemctl start nginx
#    && chown -cR openguard /var/{log,run}/gunicorn/

COPY . .
#ENTRYPOINT ["bundle", "install", "--retry", "5", "--jobs", "20"]
#chown 
#RUN gem install bundler
RUN chown -R root:root /usr/src/app/
EXPOSE 4000

#CMD ["jekyll", "serve"]
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
#CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "openguard.wsgi.applicationapplication"]
#CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "openguard.wsgi"]
#CMD ["bundle","exec","jekyll", "serve"]
#
#CMD ["python", "-u", "manage.py", "runserver"]
#CMD ["python", "-u", "manage.py", "runserver", "0.0.0.0:8000"]