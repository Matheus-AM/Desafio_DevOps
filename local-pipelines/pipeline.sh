#!/bin/bash
source "$WORKDIR/local-pipelines/steps/settup-enviroment.sh"
source "$WORKDIR/local-pipelines/steps/build-quarkus.sh"
source "$WORKDIR/local-pipelines/steps/publish-registry.sh"
# source "$WORKDIR/local-pipelines/steps/deploy-des.sh"
# source "$WORKDIR/local-pipelines/steps/deploy-prd.sh"