WORKDIR=$(pwd)

log() {
    echo "$1"
}

install_kubernetes_env(){
    ENVIRONMENT=$1
    echo "instsalling env $ENVIRONMENT"
    echo $(pwd)
    cd ../terraform
    # ref: https://stackoverflow.com/questions/55449909/error-while-configuring-terraform-s3-backend
    terraform init -reconfigure \
    -backend-config="profile=default" \
    -backend-config="endpoint=http://localhost:9000" \
    -backend-config="key=kubernetes/$ENVIRONMENT.tfstate"
    terraform apply -auto-approve=true -var-file=./environments/$ENVIRONMENT/inputs.tfvars
}

deploy_kubernetes_environments(){
    cd $WORKDIR
    install_kubernetes_env "staging"
    kubectl use-context staging
    kubectl get nodes
    wait
    cd $WORKDIR
    install_kubernetes_env "production"
    kubectl use-context production
    kubectl get nodes 
}

deploy_kubernetes_environments