

PostgrSQL database is running as container and `adminer` is running to manually check the database

`docker-compose.yaml`

```yaml
version: "3.9"
services:
  db:
    image: docker.io/library/postgres:latest
    restart: always
    container_name: postgres-openguard
    volumes:
      - ./data/db:/var/lib/postgresql/data
    ports:
      - 5432:5432
    environment:
      - POSTGRES_NAME=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
  adminer:
    image: adminer
    container_name: adminer-data-openguard
    restart: always
    ports:
      - 8080:8080
```      

## Database commands

```shell
## login
$ psql --username=hello_django --dbname=hello_django_dev
```

## Appendix

`pg_config` is required for installing `psycopg2`.

```shell
$ sudo yum install postgresql-devel
% sudo yum install python3-devel
```