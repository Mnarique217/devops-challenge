install_terraform(){
    # latest open source version
    TERRAFORM_VERSION="1.5.7"
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
}

# Ref: https://www-min-io.translate.goog/download?platform=linux&arch=amd64&_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc&_x_tr_hist=true
install_s3() {
    sudo mkdir -p ~/.aws
    password=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10)

sudo tee ~/.aws/credentials > /dev/null <<EOF
[default]
aws_access_key_id = admin
aws_secret_access_key = $password
EOF
    docker stop minio || true
    docker rm minio || true
    docker run -d \
    --name minio \
    -p 9000:9000 \
    -p 9001:9001 \
    -e "MINIO_ROOT_USER=admin" \
    -e "MINIO_ROOT_PASSWORD=$password" \
    -v ~/minio-data:/data \
    minio/minio server /data --console-address ":9001"
}