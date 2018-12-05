#!/bin/sh
set -xe

# Install local teads-central (documented @ https://confluence.teads.net/display/INFRA/teads-central+documentation)
curl -sL http://dl.teads.net/teads-central/get.sh | sh -

# Common variables
REG_URL=$(./teads-central docker dev-registry-url)

cleanup () { trap '' INT; ./teads-central docker clean-tagged; }
trap cleanup EXIT TERM
trap true INT

# common changes above this line should be done upstream #
##########################################################
source ./versions.sh

for VERSION in $VERSIONS;do
  ./teads-central docker tag-and-push --image environment-chefdk-ci --custom-tags $VERSION
  ./teads-central docker tag-and-push --image environment-chefdk-desktop --custom-tags $VERSION
done