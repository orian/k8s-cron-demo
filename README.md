## Build container:

```
git clone https://github.com/orain/k8s-cron-demo
cd k8s-cron-demo
docker build orian/crondemo:v0
```

## Ok, now one can test locally:
```
docker run --rm -it --name crondemo orian/cron:v0

# and after up to a minute, a new file: /tmp/alive.log is created:
docker exec crondemo ls /tmp
```


## Tag and push to Google Container Registry
```
# tag and push
TAG=eu.gcr.io/<PROJECT_ID>/crondemo:v0
docker tag orian/crondemo:v0 $TAG
kubectl docker -- push $TAG
```

## Run on Google Container Engine
```
# start POD
kubectl run crondemo --image=$TAG --replicas=1 --restart=Never

# check
kubectl exec crondemo ls /tmp
```

The file alive.log seems to not be created.
