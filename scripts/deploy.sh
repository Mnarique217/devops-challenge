
log() {
    echo "$1"
}

install_kubernetes(){
    cd ../terraform
    # ref: https://stackoverflow.com/questions/55449909/error-while-configuring-terraform-s3-backend
    terraform init -backend-config="profile=default" -backend-config="endpoint=http://localhost:9000"
    terraform apply -auto-approve=true
    cd ..
}