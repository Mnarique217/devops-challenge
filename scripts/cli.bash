source ./deploy.sh
source ./cleanup.sh
source ./setup-local.sh

HELP=$( cat << 'EOF'
[valid args]:
 -i-jenkins : Install jenkins in docker.
 -i-jenkins: Install jenkins
 -i-k8: Installs minikube
 -d-k8: Deletes minikube
 -i-terraform: install terraform
 -i-s3: install minio
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
   '-i-terraform')
      install_terraform
   ;;
   '-i-s3')
      install_s3
   ;;
   *)
      echo "$HELP"
   ;;
esac
