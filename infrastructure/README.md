
## Components

### VPC Module

The VPC module sets up the Virtual Private Cloud (VPC) and subnets required for the EKS cluster.

- **main.tf**: Defines the VPC and subnets.
- **outputs.tf**: Outputs the VPC ID and subnet IDs.
- **variables.tf**: Defines the variables for the VPC configuration.

### EKS Module

The EKS module sets up the EKS cluster and node groups.

- **main.tf**: Defines the EKS cluster and node groups.
- **outputs.tf**: Outputs the EKS cluster details.
- **variables.tf**: Defines the variables for the EKS configuration.

### Security Groups Module

The Security Groups module sets up the necessary security groups for the EKS cluster.

- **main.tf**: Defines the security groups.
- **outputs.tf**: Outputs the security group IDs.
- **variables.tf**: Defines the variables for the security groups configuration.

### Global Configuration

The global configuration includes the providers and versions required for the Terraform setup.

- **providers.tf**: Defines the AWS and Kubernetes providers.
- **versions.tf**: Specifies the required Terraform and provider versions.

### Production Configuration

The production configuration includes the backend configuration and the main Terraform configuration for the production environment.

- **backend.tf**: Configures the S3 backend for storing the Terraform state.
- **main.tf**: Main Terraform configuration for the production environment.
- **terraform.tfvars**: Defines the variable values for the production environment.
- **variables.tf**: Defines the variables for the production environment.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS CLI configured with appropriate permissions
- S3 bucket and DynamoDB table for Terraform state management

## Setup

### Step 1: Initialize Terraform

Navigate to the `prod` directory and initialize Terraform:

```
cd infrastructure/terraform/prod
terraform init
```

### Step 2: Validate the Configuration

Validate the Terraform configuration:

```
terraform validate
```

### Step 3: Plan the Deployment

Generate an execution plan for the deployment:

```
terraform plan
```

### Step 4: Apply the Deployment

Apply the Terraform configuration to deploy the infrastructure:

```
terraform apply
```

## Outputs

After applying the Terraform configuration, the following outputs will be available:

- **VPC ID**: The ID of the created VPC.
- **Public Subnet IDs**: The IDs of the created public subnets.
- **Private Subnet IDs**: The IDs of the created private subnets.
- **EKS Cluster ID**: The ID of the created EKS cluster.
- **EKS Cluster Endpoint**: The endpoint of the created EKS cluster.
- **EKS Cluster Certificate Authority Data**: The certificate authority data for the EKS cluster.
- **Node Group ARNs**: The ARNs of the created node groups.
- **Node Group Names**: The names of the created node groups.
- **Security Group ID**: The ID of the created security group.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
