#!/usr/bin/env bash
set -x
awslocal s3api create-bucket --bucket geodeck-gallery-files --region us-east-1 --acl public-read-write
awslocal s3api create-bucket --bucket geodeck-static-files --region us-east-1 --acl public-read-write
awslocal s3api create-bucket --bucket geodeck-gltf-files --region us-east-1 --acl public-read-write
awslocal s3api create-bucket --bucket geodeck-hdf5-files --region us-east-1 --acl public-read-write
awslocal s3api put-object --bucket geodeck-static-files --key default.png --body /docker-entrypoint-initaws.d/default.png
awslocal s3api put-bucket-cors --bucket geodeck-hdf5-files --cors-configuration  file:///docker-entrypoint-initaws.d/cors.json
awslocal s3api put-bucket-cors --bucket geodeck-gltf-files --cors-configuration  file:///docker-entrypoint-initaws.d/cors.json
set +x