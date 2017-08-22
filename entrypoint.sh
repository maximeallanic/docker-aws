#!/bin/sh

mkdir -p ~/.aws/
printf "[eb-cli]\naws_access_key_id = %s\naws_secret_access_key = %s\n" "$AWS_ACCESS_KEY_ID" "$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials
printf "[profile eb-cli]\nregion=eu-west-1\noutput=json" > ~/.aws/config

eval $@
