WORKDIR=$(pwd)

uninstall_s3(){
    sudo rm -rf ~/.aws
    docker stop minio || true
    docker rm minio || true
}

uninstall_kubernetes_env(){
    ENVIRONMENT=$1
    cd ../terraform
    # ref: https://stackoverflow.com/questions/55449909/error-while-configuring-terraform-s3-backend
    terraform init -reconfigure \
    -backend-config="profile=default" \
    -backend-config="endpoint=http://localhost:9000" \
    -backend-config="key=kubernetes/minikube/$ENVIRONMENT.tfstate"
    terraform destroy -auto-approve=true -var-file=./environments/$ENVIRONMENT/inputs.tfvars
}

destroy_kubernetes_environments(){
    cd $WORKDIR
    uninstall_kubernetes_env "staging"
    wait
    cd $WORKDIR
    uninstall_kubernetes_env "production"
}