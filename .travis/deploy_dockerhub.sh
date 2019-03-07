#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo $TRAVIS_REPO_SLUG:$TAG
docker build -f Dockerfile -t "gyllenhammar/cicd-buzz":$TAG .
docker push "gyllenhammar/cicd-buzz"