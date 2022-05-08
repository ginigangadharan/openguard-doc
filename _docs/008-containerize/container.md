
## create docker config


## create docker pull secret in kubernetes

```shell
kubectl create secret generic demo-cred \
--from-file=.dockerconfigjson=$HOME/.docker/config.json \
--type=kubernetes.io/dockerconfigjson

kubectl create secret docker-registry docker-cred --docker-server=https://index.docker.io/v1/ --docker-username=ginigangadharan --docker-password=<your-pword> --docker-email=net.gini@gmail.com
```

### See credential

```shell
$ kubectl get secret docker-cred -o yaml

## see the values
$ kubectl get secret docker-cred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode
```

## add configmap

https://www.digitalocean.com/community/tutorials/how-to-deploy-a-scalable-and-secure-django-application-with-kubernetes

https://github.com/do-community/django-polls/blob/polls-docker/django-polls/mysite/settings.py

- ENV in openguard-config repo

- ref: https://github.com/do-community/django-polls/blob/polls-docker/django-polls/mysite/settings.py
- https://www.digitalocean.com/community/tutorials/how-to-deploy-a-scalable-and-secure-django-application-with-kubernetes

## set up ingress

https://www.digitalocean.com/community/tutorials/how-to-deploy-a-scalable-and-secure-django-application-with-kubernetes

## Rollout new deployment

```shell
kubectl rollout restart deploy openguard
kubectl rollout restart deploy openguard-nginx
```

## Troubleshooting

```shell
kubectl run -it busybox --image=redhat/ubi8 --rm -- /bin/sh
kubectl run -it busybox --image=busybox --rm -- /bin/sh


podman build -t localhost/openguard . 

##nginx image
$ podman build -t localhost/openguard-nginx .


podman run -dt -p 32100:80/tcp -p 32101:8000/tcp localhost/openguard 

#You can check the ports published and occupied:
$ podman port --all 
682ab3517c78    80/tcp -> 0.0.0.0:32100
682ab3517c78    8000/tcp -> 0.0.0.0:32101


# build and push image
$ podman login docker.io

# troubleshoot
podman run -it localhost/openguard /bin/bash
````