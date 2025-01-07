# scalable-web-app
scalable-web-app

## File Structure
```
my-scalable-web-app/
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   ├── README.md
├── backend/
│   ├── service1/
│   │   ├── src/
│   │   ├── Dockerfile
│   │   ├── README.md
│   ├── service2/
│   │   ├── src/
│   │   ├── Dockerfile
│   │   ├── README.md
├── infrastructure/
│   ├── terraform/
│   │   ├── modules/
│   │   │   ├── eks_deps/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── security-groups/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── vpc/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── rds/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   ├── prod/
│   │   │   ├── backend.tf
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   ├── global/
│   │   │   ├── providers.tf
│   │   │   ├── versions.tf
│   ├── README.md
├── ci-cd/
│   ├── jenkins/
│   │   ├── Jenkinsfile
│   ├── github-actions/
│   │   ├── main.yml
├── monitoring/
│   ├── prometheus/
│   │   ├── prometheus.yml
│   ├── grafana/
│   │   ├── dashboards/
│   │   ├── datasources/
├── README.md
```
