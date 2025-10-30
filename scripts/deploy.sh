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
    kubectl create ns staging
    kubectl create ns production
    wait
    cd $WORKDIR
    install_kubernetes_env "production"
    kubectl use-context production
    kubectl create ns staging
    kubectl create ns production
    kubectl use-context staging
}

deploy_jenkins() {
    docker stop jenkins || true
    docker rm jenkins || true

    docker run -d -p 8080:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    --network bridge \
    --privileged \
    --group-add $(getent group docker | awk -F: '{print $3}') \
    --name jenkins jenkins/jenkins:lts-dev
    # get jenkins password
    sleep 5
    docker exec $(docker ps -aqf "name=jenkins") cat /var/jenkins_home/secrets/initialAdminPassword
}

deploy_jenkins_agent() {
    # REF: https://hub.docker.com/r/jenkins/inbound-agent
    AGENT_SECRET=$1
    if [ -z "${VAR}" ]; then
        echo "jenkins secret is mandatory..."
    fi

    JENKINS_URL="http://localhost:8080"
    AGENT_NAME="builder"
    docker run -d --name jenkins-agent \
    --network host \
    jenkins/inbound-agent:latest-jdk17 \
    -url http://localhost:8080 \
    -name builder \
    -secret $AGENT_SECRET \
    -workDir /home/jenkins/agent
}