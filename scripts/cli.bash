source ./deploy.sh
source ./cleanup.sh

HELP=$( cat << 'EOF'
[valid args]:
 -i-jenkins : Install jenkins in docker.
EOF
)

ARG=$1
case $ARG in
   '-i-jenkins')
      deploy_jenkins
   ;;
   '-i-k8')
      deploy_kubernetes_environments
   ;;
   '-d-k8')
      destroy_kubernetes_environments
   ;;
   *)
      echo "$HELP"
   ;;
esac
