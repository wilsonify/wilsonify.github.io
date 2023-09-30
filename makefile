# function for creating version files with version string and date
ver_file = echo "1.0.0" > $(1) && date +%Y-%m-%d >> $(1)

all: clean build/image.txt

clean:
	rm -rf build
	rm -rf docs

build_dir:
	mkdir -p build

build/base.txt: build_dir
	docker build --progress=plain -t ghcr.io/wilsonify/wilsonify.github.io.base:latest -f Dockerfile-base . && $(call ver_file, $@)

build/builder.txt: build/base.txt
	docker build --progress=plain -t ghcr.io/wilsonify/wilsonify.github.io.builder:latest -f Dockerfile-builder . && $(call ver_file, $@)

build/image.txt: build/builder.txt
	docker build --progress=plain -t ghcr.io/wilsonify/wilsonify.github.io:latest -f Dockerfile . && $(call ver_file, $@)

build/run.txt: build/image.txt
	docker stop wilsonify.github.io || true
	docker run --rm -d --name wilsonify.github.io -p 80:80 ghcr.io/wilsonify/wilsonify.github.io:latest && $(call ver_file, $@)

build/update.txt: build_dir
	docker stop wilsonify.github.io.builder
	docker pull ghcr.io/wilsonify/wilsonify.github.io.builder:main && $(call ver_file, $@)

/docs/index.html:
	docker run --rm \
  --name wilsonify.github.io.builder \
  --volume $(shell pwd):/usr/src/app \
  ghcr.io/wilsonify/wilsonify.github.io.builder:main \
  R -e 'rmarkdown::render_site()'

tag:
	docker tag ghcr.io/wilsonify/wilsonify.github.io:latest 064592191516.dkr.ecr.us-east-1.amazonaws.com/wilsonify.github.io:latest

push:
	aws --profile 064592191516 ecr get-login-password | docker login --username AWS --password-stdin 064592191516.dkr.ecr.us-east-1.amazonaws.com
	docker push 064592191516.dkr.ecr.us-east-1.amazonaws.com/wilsonify.github.io:latest

ecs-config:
	AWS_PROFILE=064592191516 ecs-cli  configure --cluster thom-ecs-cluster --region us-east-1

ecs-up:
	ecs-cli up \
	--keypair id_rsa \
	--capability-iam \
	--size 1 \
	--instance-type t2.medium \
	--cluster-config thom-ecs-conf


ecs-deploy:
	ecs-cli compose up --cluster-config thom-ecs-conf
