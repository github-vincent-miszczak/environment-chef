CHEFDK_ENV=${CHEFDK_ENV:-"ci"}
CHEFDK_RUN='docker run -it --rm --net=host --device /dev/vboxdrv --hostname env-chef$CHEFDK_VERSION -e EDITOR=$EDITOR -e CHEFDK_VERSION=$CHEFDK_VERSION -e DOCKER=true -e USERID=$UID -e USER=$USER -e HOME=$HOME -e CPWD=$(pwd) -v $HOME:$HOME environment-chefdk-$CHEFDK_ENV'
CHEFDK_VERSION_DEFAULT="1.3.40"

function knife {
  environment-chefdk /opt/chefdk/bin/knife "$@"
}

function chef {
  environment-chefdk /opt/chefdk/bin/chef "$@"
}

function kitchen {
  if [[ "$CHEFDK_ENV" == "desktop" ]]; then
    echo "Starting environment-chef..."
    environment-chefdk
  else
    environment-chefdk /opt/chefdk/bin/kitchen "$@"
  fi  
}

function berks {
  environment-chefdk /opt/chefdk/bin/berks "$@"
}

function rubocop_chef {
  environment-chefdk /opt/chefdk/embedded/bin/rubocop "$@"
}