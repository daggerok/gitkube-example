# gitkube cli
Use regular git commands (git push workflow) for k8s deployments

## first blood

* install gitkube binaries by downloading it and putting into your bin directory...
* when Dockerfile and k8s.yaml manifast will be created, run `gitkube install` command
* generate gitkube remote.yaml manifest by using `gitkube remote generate -f mapp-remote.yaml` command
* use custom configuration for `mapp` remote for docker registry and configure your username / password
* create deployment first (even if docker images hasn't been built): `kubectl create -f k8s.yaml`
* create remote by using `gitkube remote create -f mapp-remote.yaml` command
* copy remote url as `export GIT_REMOTE_URL=ssh://default-mapp@localhost/~/git/default-mapp` and create `git remote add mapp $GIT_REMOTE_URL` command
* now do deployment just with regular `git push mapp master` command!
* ...open http://127.0.0.1:8080...

## bug / cr

* next time, fix some bug-fix or implement change-request and commit it with some usefull git message
* finally redeploy new software by using regulat `git push mapp master` command again...

## cleanup

```bash
kubectl delete -f k8s.yaml
kubectl delete secret regsecret      -n default
kubectl delete secret mapp-regsecret -n default
git remote rm mapp
gitkube remote delete mapp
gitkube uninstall
```

## re-do after clean / clone

```bash
kubectl create secret docker-registry regsecret --docker-server=https://index.docker.io/v1/ \
  --docker-username=daggerok --docker-email=daggerok@gmail.com \
  --docker-password=...

kubectl create -f k8s.yaml
gitkube remote create -f mapp-remote.yaml
git remote add mapp ssh://default-mapp@localhost/~/git/default-mapp
git push mapp master
http :8080
```

## resources

* https://github.com/hasura/gitkube/blob/master/docs/registry.md
* https://github.com/hasura/gitkube
* https://gitkube.sh/
* https://www.youtube.com/watch?v=l9h03j0NDEg
* https://www.youtube.com/watch?v=ECB9vLvBXog
* https://www.youtube.com/watch?v=eRimsG6pDH8
