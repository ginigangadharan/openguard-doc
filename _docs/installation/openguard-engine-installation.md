---
title: OpenGuard Engine Installation
tags:
 - installation
description: OpenGuard Engine Installation
---

# OpenGuard Engine Installation

OpenGuard Engine is avaialbe as docker container image and can be run as a container or as an deployment in Kubernetes (Recommended) or OpenShift platform.

<TODO - registry image or path>

## Deploying OpenGuard Engine in Kubernetes

## Prerequisites

- A Kubernetes Cluster with deployment access
- Access to the OpenGuard Engine image (public or private)
- Install and configure database before the instllation

### Configure Docker Registry access

```shell
$ kubectl create secret docker-registry docker-cred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=your_username \
  --docker-password=your_password \
  --docker-email=your_email_address

## Verify credential
$ kubectl get secret docker-cred -o yaml
```

### Deploying OpenGuard Engine using Helm

OpenGuard Engine deployment configuration are avaialbe as Helm charts in [ginigangadharan/openguard-kubernetes-helm-charts](https://github.com/ginigangadharan/openguard-kubernetes-helm-charts) repository.

*Helm is a Kubernetes deployment tool for automating creation, packaging, configuration, and deployment of applications and services to Kubernetes clusters.*

```shell
## clone repo
$ git clone https://github.com/ginigangadharan/openguard-kubernetes-helm-charts

$ cd openguard-kubernetes-helm-charts
$ helm install openguard openguard-app/
```

The Helm chart will deploy following components to Kubernetes

- A `configmap` resource to store app details

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: openguard-config
  labels:
    app: postgres
data:
  DJANGO_ALLOWED_HOSTS: "*"
  DJANGO_LOGLEVEL: "info"
  DEBUG: "True"
```

- A `deployment` resource for OpenGuard app

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: openguard
  labels:
    app: openguard
spec:
  replicas: 1
  selector:
    matchLabels:
      app: openguard
  template:
    metadata:
      labels:
        app: openguard
    spec:
      containers:
        - name: openguard
          image: ginigangadharan/openguard-app:latest
          
          ports:
            - containerPort: 8000
              name: pythonport
          envFrom:
          - secretRef:
              name: openguard-secrets
          - configMapRef:
              name: openguard-config
      imagePullSecrets:
        - name: docker-cred
```

- A `service` resource to expose the OpenGuard dashboard and API.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: openguard
spec:
  selector:
    app: openguard
  type: NodePort
  #type: LoadBalancer
  ports:
    - protocol: TCP
      port: 8000
      targetPort: 8000
      nodePort: 32005
```

