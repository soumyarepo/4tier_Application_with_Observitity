# 4tier_Application_with_Observitity
production-grade project design for a Four-Tier Banking Application deployed on Amazon EKS using GitHub Actions, with deep observability, controlled load spikes, and SLO-driven autoscaling.

Client
  |
  v
[Frontend (React)]
  |
  v
[API Gateway / Ingress (NGINX)]
  |
  v
[Backend Services (Spring Boot / Node.js)]
  |
  v
[Data Tier (RDS PostgreSQL)]

Supporting Infrastructure---------------------------------
Amazon EKS

AWS ALB Ingress Controller

Prometheus + Alertmanager

Grafana

AWS CloudWatch

Cluster Autoscaler

HPA + VPA (recommendation mode)

GitHub Actions CI/CD

ECR for images

Chaos & Load testing


Pipeline Stages

1. Code Checkout
2. Unit Tests
3. SonarQube Scan
4. Build Docker Images
5. Trivy Image Scan
6. Push to Amazon ECR
7. Helm Deployment to EKS
8. Post-deploy smoke tests


banking-4tier-app/
│
├── frontend/          # React UI
├── ingress/           # NGINX config
├── backend/
│   ├── auth-service/
│   ├── account-service/
│   └── transaction-service/
│
├── database/
│   └── init.sql
│
├── docker-compose.yml

1️⃣ Build 4-tier app (YOU ARE HERE)
2️⃣ Dockerize each tier
3️⃣ Push images to ECR
4️⃣ Deploy to EKS with Helm
5️⃣ Add Prometheus & Grafana
6️⃣ Introduce load spike
7️⃣ Observe pod/node pressure
8️⃣ Tune HPA, CA, PDB, alerts

curl -X POST http://localhost:8080/transaction/transfer \
  -H "Content-Type: application/json" \
  -d '{"amount":100}'
