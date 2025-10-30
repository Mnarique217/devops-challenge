| Item                        | Description                                   | Implemented |
| --------------------------- | --------------------------------------------- | ----------- |
| Staging Environment         | Create `staging` namespace                    | [DONE]         |
| Production Environment      | Create `production` namespace                 | [DONE]         |
| Environment Configurations  | Apply environment-specific configs            | [DONE]         |
| Resource Requests & Limits  | Set CPU/memory requests and limits            | [DONE]         |
| Readiness & Liveness Probes | Define probes for container health            | [DONE]         |
| Env Vars & ConfigMaps       | Externalize configs with ConfigMaps           | [PARTIAL]      |
| Secrets Management          | Use Kubernetes Secrets (no hardcoding)        | [PENDING]      |
| Service Exposure            | Define Service type (ClusterIP, NodePort, LB) | [DONE]         |
| Ingress (TLS)               | Configure Ingress with TLS                    | [DONE]         |
| Ingress (Local)             | NGINX + self-signed certificates              | [PENDING]      |
| Network Policies            | Implement restrictive policies (optional)     | [DONE]         |
| RBAC                        | Configure Role-Based Access Control           | [DONE]         |
| Pod Security Standards      | Enforce PodSecurity or PSP (legacy)           | [DONE]         |
| HPA                         | Implement Horizontal Pod Autoscaler           | [DONE]         |
| PVC                         | Add Persistent Volume Claims if needed        | [NO]           |
