#!/bin/sh
set -xe

source ./versions.sh

for VERSION in $VERSIONS;do
  make ${VERSION}
done
