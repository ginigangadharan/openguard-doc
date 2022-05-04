---
title: Database for OpenGuard
tags:
 - installation
description: Database for OpenGuard
---
# Database for OpenGuard 

OpenGuard is supporting only PostgreSQL database (or SQLite but not recommended) at the moment.

The database server can be a standalone server, a docker container or a managed database service.

For the demonstration and testing, a PostgreSQL database server on Kubernetes can be utilized.

## Installing PostgreSQL on Kubernetes using Helm

PostgreSQL deployment configuration are avaialbe as Helm charts in [ginigangadharan/openguard-kubernetes-helm-charts](https://github.com/ginigangadharan/openguard-kubernetes-helm-charts) repository.

*Helm is a Kubernetes deployment tool for automating creation, packaging, configuration, and deployment of applications and services to Kubernetes clusters.*

```shell
## clone repo
$ git clone https://github.com/ginigangadharan/openguard-kubernetes-helm-charts

$ cd openguard-kubernetes-helm-charts
$ helm install openguard postgres/
```

The Helm chart will deploy following components to Kubernetes.

1. A `configmap` to store database details
2. A `PersistentVolumeClaim` for storing data
3. A `Deployment` for PostgreSQL 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: postgres
  name: postgres
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
        - name: postgres
          image: postgres:10.4
          imagePullPolicy: "IfNotPresent"
          ports:
            - containerPort: 5432
          envFrom:
            - configMapRef:
                name: postgres-config
          volumeMounts:
            - mountPath: /var/lib/postgresql/data
              name: postgredb
      volumes:
        - name: postgredb
          persistentVolumeClaim:
            claimName: postgres-data
```

4. A `service` to expose the PostgreSQL db to be acccessed by the applications.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: postgres
spec:
  selector:
    app: postgres
  type: NodePort
  #type: LoadBalancer
  ports:
    - protocol: TCP
      port: 5432
      targetPort: 5432
      nodePort: 32003
```

## The adminer applications

The `adminer` application is a GUI for managing database and can be used to troubleshoot database connections, tables etc.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: adminer
  labels:
    app: adminer
spec:
  selector:
    matchLabels:
      app: adminer
  template:
    metadata:
      labels:
        app: adminer
    spec:
      containers:
        - name: adminer
          image: adminer:4.6.3
          ports:
            - containerPort: 8080
          env:
            - name: ADMINER_DESIGN
              value: "pappu687"
```

Since `adminer` is a GUI application, the deployment need to expose as follows.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: adminer
spec:
  selector:
    app: adminer
  type: NodePort
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
      nodePort: 32004
```