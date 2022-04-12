---
title: Installation
tags:
 - installation
description: OpenGuard Installation
---

# OpenGuard Installation

OpenGuard has basically three components.

1. OpenGuard Engine
2. OpenGuard Runner
3. Database

## OpenGuard Engine Installation
OpenGuard will be deployed as Linux container either as a stand-alone container or inside any Kubernetes or OpenShift cluster.

Kubernetes Helm charts are available to deploy the OpenGuard application. 

Refer to [OpenGuard Installation](openguard-engine-installation) for more details.


## OpenGuard Runner Installation

OpenGuard Runner is a simple python program which will be configured as a `systemd` service inside a Linux machine. 

Refer to [OpenGuard Runner Installation](openguard-runner-installation) for more details.

## Database Installation

The database should be any support PostgreSQL database server. 

Refer to [PostgreSQL Database Installation](database-installati) for more details.