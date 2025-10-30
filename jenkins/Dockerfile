FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl wget git nodejs npm buildah podman fuse-overlayfs uidmap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# tfsec for terraform
RUN mkdir -p /tmp/build \
    cd /tmp/build && \
    wget https://github.com/aquasecurity/tfsec/releases/download/v1.28.14/tfsec_1.28.14_linux_amd64.tar.gz && \
    tar -xzf tfsec_1.28.14_linux_amd64.tar.gz && \
    chmod +x tfsec && \
    mv tfsec /usr/local/bin/ && \
    cd / && \
    rm -rf /tmp/build

# trivy
RUN wget https://github.com/aquasecurity/trivy/releases/download/v0.67.2/trivy_0.67.2_Linux-64bit.deb && \
    dpkg -i trivy_0.67.2_Linux-64bit.deb && \
    rm -rf trivy_0.67.2_Linux-64bit.deb

# grype
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm -rf ./get_helm.sh

# kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

RUN npm install -g eslint && \
    npm cache clean --force

USER jenkins