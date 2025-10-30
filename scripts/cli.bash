source ./deploy.sh

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
   *)
      echo "$HELP"
   ;;
esac
