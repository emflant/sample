#!/bin/bash

## build ARGs
NCPUS=${NCPUS:-1}

apt-get update -qq && apt-get -y --no-install-recommends install \
    vim && \
  rm -rf /var/lib/apt/lists/*

install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    gcookbook \
    esquisse \
    keras
rm -rf /tmp/downloaded_packages
