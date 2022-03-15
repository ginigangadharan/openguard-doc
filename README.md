# OpenGuard Documentation

- [OpenGuard Documentation](#openguard-documentation)
  - [Run local documentation](#run-local-documentation)
  - [Can I contribute ?](#can-i-contribute-)
  - [Troubleshooting](#troubleshooting)
    - [pip install psycopg2 - Error: pg_config executable not found.](#pip-install-psycopg2---error-pg_config-executable-not-found)
  - [Appendix](#appendix)

## Run local documentation

```shell
$ cd docs
$ bundle exec jekyll serve
.
.
.
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```

## Can I contribute ?

Sure, you may please submit additional resources and updates via PR.

(*Please keep the directory structre as it is as we have links to this repository from external sites.*)

## Troubleshooting

### pip install psycopg2 - Error: pg_config executable not found.

Error while installing `psycopg2`

```shell
pip install psycopg2
Collecting psycopg2
  Using cached psycopg2-2.9.3.tar.gz (380 kB)
  Preparing metadata (setup.py) ... error
  error: subprocess-exited-with-error
  
  × python setup.py egg_info did not run successfully.
  │ exit code: 1
  ╰─> [20 lines of output]
      running egg_info
      creating /private/var/folders/8f/v0tpqxg56wsf9x6x6tntjt5h0000gn/T/pip-pip-egg-info-_nbkuheo/psycopg2.egg-info
      writing manifest file '/private/var/folders/8f/v0tpqxg56wsf9x6x6tntjt5h0000gn/T/pip-pip-egg-info-_nbkuheo/psycopg2.egg-info/SOURCES.txt'
      
      Error: pg_config executable not found.
      .
      .
      .
```

**Solution**

Install postgresql

## Appendix

- [Building with Buildah: Dockerfiles, command line, or scripts](https://www.redhat.com/sysadmin/building-buildah)