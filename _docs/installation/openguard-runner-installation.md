---
title: OpenGuard Runner Installation
tags:
 - installation
description: OpenGuard Runner Installation
---
# OpenGuard Runner Installation

## Download the OpenGuard Runner 

Download the OpenGuard Runner application from [GitHub repository](https://github.com/ginigangadharan/openguard-runner)(Private Repo).

Note: The repository contains Vagrantfile to initiate and start a virtual machine and run OpenGuard Runner automatically. The repository content will be available as `/vagrant/` directory.

## Create configuration file

Create the configuration file `/etc/openguard-runner/openguard-runner.yaml` for the runner to access the OpenGuard Engine.

```shell
root@CP-OpenGuard-Runner:~# cat /etc/openguard-runner/openguard-runner.yaml
### OpenGuard Runner Configuration
access:
  token: 'a7fdcd30f90350dafa260ed1bf1fa207aeb37ee4'
  openguard_job_api_url: 'http://192.168.56.1:8000/api/incident_fix/'
environment:
  agent_name: 'OpenGuard Runner'
  base_directory: '/vagrant'
  check_interval_in_seconds: 5
```

## Create Systemd file for OpenGuard Runner

Create the file `/etc/systemd/system/openguard-runner.service` as follows.

```shell
[Unit]
Description=OpenGuard Runner
After=multi-user.target
[Service]
Type=simple
Restart=always
ExecStart=/usr/bin/python3 /vagrant/openguard-runner-start.py
ExecStop=/usr/bin/python3 /vagrant/openguard-runner-stop.py
[Install]
WantedBy=multi-user.target
```

## Install Python Libraries

Note: Install libraries for `root` user as the service will be running as `root`.

```shell
# pip install -r requirements.txt
```

## Start OpenGuard Runner service

```shell
$ sudo systemctl daemon-reload
$ sudo systemctl enable openguard-runner.service
$ sudo systemctl start openguard-runner.service
```

Verify the service

```shell
$ sudo systemctl status openguard-runner.service
● openguard-runner.service - OpenGuard Runner
     Loaded: loaded (/etc/systemd/system/openguard-runner.service; enabled; ve>
     Active: active (running) since Thu 2022-03-17 01:33:41 UTC; 1min 55s ago
   Main PID: 31041 (python3)
      Tasks: 1 (limit: 467)
     Memory: 21.6M
     CGroup: /system.slice/openguard-runner.service
             └─31041 /usr/bin/python3 /vagrant/run_fix_jobs.py

Mar 17 01:33:41 CP-OpenGuard-Runner systemd[1]: openguard-runner.service: Sche>
Mar 17 01:33:41 CP-OpenGuard-Runner systemd[1]: Stopped OpenGuard Runner.
Mar 17 01:33:41 CP-OpenGuard-Runner systemd[1]: Started OpenGuard Runner.
```

