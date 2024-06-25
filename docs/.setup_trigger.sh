#!/bin/bash

gcloud services enable \
    cloudbuild.googleapis.com \
    artifactregistry.googleapis.com \
    containerregistry.googleapis.com

gcloud config set project directed-sensor-273101

gcloud builds triggers create github \
    --region us-central1 \
    --repo-name docs-to-confluence \
    --repo-owner dbrtly \
    --branch-pattern main \
    --build-config docs/.cloudbuild.confluence.yaml \
    --include-logs-with-status
