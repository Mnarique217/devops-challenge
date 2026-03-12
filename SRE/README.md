
## Exploring the application

```
cd application
npm i
```

## Creating a Docker Image

```
docker build ./application --file ./application/Dockerfile --tag app:v1.0.0
```

## How to Deploy the Container

```
docker run -d -p 3000:3000 app:v1.0.0
```

## Kubernetes Orchestration

```
---
# Source: app/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: demo-app
  
  labels:
    helm.sh/chart: app-0.1.0
    app.kubernetes.io/name: app
    app.kubernetes.io/instance: demo
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
automountServiceAccountToken: true
---
# Source: app/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: demo-app
  
  labels:
    helm.sh/chart: app-0.1.0
    app.kubernetes.io/name: app
    app.kubernetes.io/instance: demo
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  type: ClusterIP
  ports:
    - port: 3000
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: app
    app.kubernetes.io/instance: demo
---
# Source: app/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-app
  
  labels:
    helm.sh/chart: app-0.1.0
    app.kubernetes.io/name: app
    app.kubernetes.io/instance: demo
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: app
      app.kubernetes.io/instance: demo
  template:
    metadata:
      labels:
        helm.sh/chart: app-0.1.0
        app.kubernetes.io/name: app
        app.kubernetes.io/instance: demo
        app.kubernetes.io/version: "1.16.0"
        app.kubernetes.io/managed-by: Helm
    spec:
      serviceAccountName: demo-app
      containers:
        - name: app
          securityContext:
            capabilities:
              drop:
              - ALL
            readOnlyRootFilesystem: true
            runAsNonRoot: true
            runAsUser: 1000
          image: "host.docker.internal:5000/app:1.0.0"
          env:
            - name: NODE_ENV
              value: prod

          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 3000
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /health
              port: http
          readinessProbe:
            httpGet:
              path: /ready
              port: http
          resources:
            limits:
              cpu: 100m
              memory: 128Mi
            requests:
              cpu: 100m
              memory: 128Mi
```

## Registry to Preserve Docker Images

```
docker run -d \
  -p 5000:5000 \
  --name local-registry \
  registry:2
```