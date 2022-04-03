#!/usr/bin/env bash
set -x
awslocal s3 mb s3://geodeck-gallery-files
awslocal s3 mb s3://geodeck-static-files
awslocal s3 mb s3://geodeck-gltf-files
awslocal s3 mb s3://geodeck-hdf5-files
set +x