source $(dirname $BASH_SOURCE)/chef_env_hooks.sh

function environment-chefdk {
  if [ $# -ne 0 ];then
    local command="$1"
    shift
  fi  

  CHEFDK_VERSION=${CHEFDK_VERSION:-$CHEFDK_VERSION_DEFAULT}  

  if [ -z "$DOCKER" ]; then    
    eval "${CHEFDK_RUN}:${CHEFDK_VERSION} ${command} $@"   
  else
    eval "${command} $@"
  fi
}