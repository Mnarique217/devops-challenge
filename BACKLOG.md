# TODO
I was not able to fully update this file and all requested changes due to time limitations, 2 and 1/2 days was very challenging due to several issues faced during the process.


## 🏗️ Part 1 – Infrastructure as Code with Terraform

| Item                               | Description                                               | Implemented  |
| ---------------------------------- | --------------------------------------------------------- | ------------ |
| Modular Structure                  | Use reusable Terraform modules                            | [DONE]       |
| Variables & Outputs                | Define inputs/outputs clearly for all modules             | [DONE]       |
| State Management                   | Use remote backend (S3, GCS, etc.) with locking           | [DONE]       |
| Environment Separation             | Create isolated workspaces or directories (dev/stage/prod)| [DONE]       |
| IaC Scanning                       | Integrate `tfsec` or `checkov` for Terraform scanning     | [DONE]       |
| Security Enforcement               | Fail pipeline on critical misconfigurations               | [DONE]       |
| Version Locking                    | Lock Terraform & provider versions                        | [WIP]        |
| Security Documentation             | Record security decisions and exceptions                  | [PENDING]    |
| Setup Documentation                | Provide clear setup and usage instructions                | [PENDING]    |
| Architecture Diagrams              | Include visual diagrams of infrastructure                 | [PENDING]    |

## 🚀 Part 2 – CI/CD with Jenkins

| Item.                                                                                            | Implemented |
| ----------------------------------------------------------------------------------------------- | ------------ |
| Pull source code from Git                                                                       | [DONE]    |
| Set up workspace and environment variables                                                      | [DONE]    |
| Scan Terraform code using `tfsec` or `checkov`                                                  | [DONE]    |
| Optional: Application code scan (SonarQube, ESLint, etc.)                                       | [DONE]    |
| Generate security reports                                                                       | [DONE]    |
| Build Docker image for sample application                                                       | [DONE]    |
| Tag with build number and commit hash                                                           | [PENDING]    |
| Push to registry (DockerHub for cloud, local registry for local setup)                          | [DONE]    |
| Scan container images with `Trivy` or `Grype`                                                   | [DONE]    |
| Check for vulnerabilities and compliance                                                        | [DONE]    |
| Generate security reports                                                                       | [DONE]    |
| Deploy to Kubernetes cluster                                                                    | [DONE]    |
| Support both Helm charts and YAML manifests                                                     | [DONE]    |
| Implement environment promotion (dev → staging → prod)                                          | [DONE]    |
| Manual approval gates for production                                                            | [DONE]    |
| Version-based rollback using Git tags                                                           | [PENDING]    |
| Helm revision rollback                                                                          | [DONE]    |
| Database migration rollback (if applicable)                                                     | [NO]    |


## Part 3

| Item                                                                                             | Implemented  |
| ------------------------------------------------------------------------------------------------ | ------------ |
| **Staging Environment**: `staging` namespace                                                     | [PENDING]    |
| **Production Environment**: `production` namespace                                               | [PENDING]    |
| Environment-specific configurations                                                              | [PENDING]    |
| Resource requests and limits                                                                     | [DONE]       |
| Readiness and liveness probes                                                                    | [DONE]       |
| Environment variables and ConfigMaps                                                             | [PARTIAL]    |
| Secrets management (non-hardcoded)                                                               | [PARTIAL]    |
| Service exposure (ClusterIP, NodePort, or LoadBalancer)                                          | [DONE]       |
| Ingress configuration with TLS                                                                   | [PENDING]    |
| **Local**: NGINX Ingress with self-signed certificates                                           | [PENDING]    |
| Network Policies (optional but recommended)                                                      | [PENDING]    |
| RBAC (Role-Based Access Control)                                                                 | [PENDING]    |
| Pod Security Policies/Standards                                                                  | [PENDING]    |
| Horizontal Pod Autoscaling (HPA)                                                                 | [DONE]       |
| Persistent Volume Claims (if needed)                                                             | [PENDING]    |


## 🔐 Part 4 – Security Practices

| Description                                                                                     | Implemented |
| ------------------------------------------------------------------------------------------------ | ------------ |
| **Terraform Scanning**: Use `tfsec` or `checkov` in CI/CD pipeline                               | [DONE]    |
| **Policy as Code**: Implement security policies and compliance checks                            | [PENDING] |
| **Access Control**:                                                                              | [PENDING] |
| **AWS**: IAM roles with least-privilege principles                                               | [NO]      |
| **Local**: Kubernetes RBAC and service accounts                                                  | [PENDING] |
| **Image Scanning**: Use `Trivy`, `Grype`, or `Docker Scout`                                      | [DONE]    |
| **Base Image Security**: Use minimal, updated base images                                        | [DONE]    |
| **Runtime Security**: Non-root containers, read-only filesystems                                 | [DONE]    |
| **Never commit secrets** to version control                                                      | [DONE]    |
| **Jenkins**: Use Jenkins Credentials Store                                                       | [DONE]    |
| **Kubernetes**: Use Secrets and ConfigMaps                                                       | [PENDING] |
| **Local Development**: Use `.env` files (gitignored)                                             | [DONE]    |
| Security scan reports in CI/CD                                                                   | [PENDING] |
| Vulnerability tracking and remediation                                                           | [PENDING] |
| Compliance reporting                                                                             | [PENDING] |
| Security metrics and alerting                                                                    | [PENDING] |
