WORKDIR=$(pwd)

uninstall_s3(){
    sudo rm -rf ~/.aws
    docker stop minio || true
    docker rm minio || true
}

uninstall_kubernetes(){
    cd $WORKDIR/../terraform
    terraform init -backend-config="profile=default" -backend-config="endpoint=http://localhost:9000"
    terraform destroy -auto-approve=true
    cd $WORKDIR
}
