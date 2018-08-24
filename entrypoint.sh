#!/bin/sh

# if we have "--link some-docker:docker" and not DOCKER_HOST, let's set DOCKER_HOST automatically
if [ -z "$DOCKER_HOST" -a "$DOCKER_PORT_2375_TCP" ]; then
	export DOCKER_HOST='tcp://docker:2375'
fi

## AWS EB
mkdir -p ~/.aws/
printf "[eb-cli]\naws_access_key_id = %s\naws_secret_access_key = %s\n" ${AWS_KEY} ${AWS_SECRET} > ~/.aws/credentials
printf "[profile eb-cli]\nregion=eu-west-1\noutput=json" > ~/.aws/config

## AWS ECS
if [ ! -z "${AWS_ECS_CLUSTER}" ]
 then
    ecs-cli configure --access-key ${AWS_KEY} --secret-key ${AWS_SECRET} --cluster ${AWS_ECS_CLUSTER} --region eu-west-1
fi

exec "${@}"

