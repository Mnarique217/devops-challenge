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

| Item                                                                                        | Implemented |
| ------------------------------------------------------------------------------------------- | ------------ |
| Pull source code from Git and set up workspace/environment variables                                    | [DONE] |
| Scan Terraform with `tfsec` or `checkov`; optional app scan (SonarQube, ESLint, etc.); generate reports | [DONE] |
| Build Docker image, tag with build number & commit hash, and push to registry                           | [DONE] |
| Scan images with `Trivy` or `Grype` for vulnerabilities and compliance; generate reports                | [DONE] |
| Deploy to Kubernetes via Helm or YAML; support environment promotion and approval gates                 | [DONE] |
| Implement Git tag, Helm, and database migration rollbacks (if applicable)                               | [DONE] |

## Part 3

| Item                                              | Implemented  |
| ------------------------------------------------- | ------------ |
| Use Helm templates for Kubernetes manifests       | [DONE]       |
| Manage releases via Helm charts and repositories  | [NO]         |
| Enable simple versioned upgrades and rollbacks    | [DONE]       |

## 🔐 Part 4 – Security Practices

| Item                                                  | Implemented |
| ------------------------------------------------------------ | ------------ |
| Use `tfsec` or `checkov` in CI/CD pipeline                   | [DONE]    |
| Kubernetes RBAC and service accounts                          | [DONE]       |
| Use `Trivy`, `Grype`, or `Docker Scout`                       | [DONE]    |
| Non-root containers, read-only filesystems                    | [DONE]    |
| Never commit secrets to version control                       | [DONE]    |
| Generate security reports in CI/CD                            | [DONE]       |
| Implement security policies and compliance checks             | [PENDING]    |
| Use minimal, updated base images                              | [PENDING]    |
| Use Jenkins Credentials Store                                 | [PENDING]    |
| Use Kubernetes Secrets and ConfigMaps                         | [PARTIAL]    |
| Use `.env` files (gitignored)                                 | [PENDING]    |
| Track vulnerabilities and remediation                         | [PENDING]    |
| Implement compliance reporting                                | [PENDING]    |
| Capture metrics and set up alerting                           | [PENDING]    |