IMAGE_NAME = truss-demo
IMAGE_REPO = 127178877223.dkr.ecr.us-east-2.amazonaws.com/truss/${IMAGE_NAME}
LOCAL_TAG = ${IMAGE_NAME}:latest
GIT_SHA = $(shell git rev-parse HEAD)
REMOTE_TAG = ${IMAGE_REPO}:${GIT_SHA}

push:
	docker tag ${LOCAL_TAG} ${REMOTE_TAG}
	docker push ${REMOTE_TAG}

build:
	docker build -t truss-demo:latest .

bundle_update:
	docker run -v `pwd`:/usr/src/app truss-demo:latest bundle update
