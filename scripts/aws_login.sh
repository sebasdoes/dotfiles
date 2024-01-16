#!/bin/bash

while getopts e: flag
do
    case "${flag}" in
        e) env=${OPTARG};;
    esac
done

echo $env
saml_login login -e $env -p $env 
export AWS_PROFILE=$env

aws ecr get-login-password | docker login -u AWS --password-stdin "https://$(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.eu-central-1.amazonaws.com"

