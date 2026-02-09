
# AWS ECS Fargate Automation with Terraform

This repository contains a modularized Terraform configuration to automate the deployment of a highly available,
secure, and scalable containerized application using Amazon ECS (Elastic Container Service) on AWS Fargate.


# 🚀 Architecture Overview

The automation provisions the following infrastructure components:

ECS Cluster: A logical grouping of Fargate tasks.

ECS Task Definition: Blueprints for the application (CPU, Memory, Docker Image).

ECS Service: Manages task scheduling and maintains the desired count of running containers.

Capacity Providers: Configured for Fargate (On-demand) with support for Fargate Spot.

CloudWatch Logs: Automated log group creation for centralized container monitoring.

IAM Roles: Task execution roles with least-privilege permissions.

Load Balancing: Integration with an existing Application Load Balancer (ALB) via Target Groups.


# 📁 File Structure

main.tf: Core logic for ECS Cluster, Service, and Task Definitions.

variables.tf: Input variable definitions for environment-specific configurations.

prod.tfvars: Example production environment values (Sizing, Image URIs).

outputs.tf: Exports critical data like Service names and Cluster ARNs.


# 🛠 Prerequisites

Before deploying, ensure you have:

Terraform CLI (v1.0+) installed.

AWS CLI configured with appropriate credentials.

An existing VPC with private subnets.

An ECR Repository containing your Docker image.

An ACM SSL Certificate (if using HTTPS listeners).

🔧 Deployment Steps

1. Initialize Terraform

Download providers and initialize the backend.

~ terraform init


2. Review the Plan

Check exactly what resources will be created. Use the prod.tfvars file for production-grade settings.

~ terraform plan -var-file="prod.tfvars"


3. Apply the Configuration

Provision the infrastructure to your AWS account.

~ terraform apply -var-file="prod.tfvars" -auto-approve



# ⚙️ Configuration Variables

Name

Description

Default

project_name

Name prefix for all resources

banking-app

environment

Deployment stage (dev/prod)

-

cpu

Fargate CPU units (256, 512, 1024...)

256

memory

Fargate Memory (512, 1024, 2048...)

512

desired_count

Number of containers to run

1

container_image

URI of the Docker image in ECR

-


# 🛡 Security & Best Practices

Serverless Compute: Uses Fargate to remove the need for managing EC2 instances, reducing the attack surface.

Private Networking: Tasks are deployed in private subnets with no direct internet access.

Logging: All container stdout is captured in AWS CloudWatch for auditing and troubleshooting.

Tagging Strategy: All resources are tagged with Environment and Project for cost allocation.


# 🧹 Cleanup

To avoid ongoing AWS costs, destroy the infrastructure when finished:

terraform destroy -var-file="prod.tfvars"
