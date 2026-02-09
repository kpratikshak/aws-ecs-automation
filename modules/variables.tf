# ==========================================
# GENERAL PROJECT VARIABLES
# ==========================================
variable "project_name" {
  description = "The name of the project used for naming resources"
  type        = string
  default     = "banking-app"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, prod, staging)"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

# ==========================================
# NETWORKING VARIABLES
# ==========================================
variable "vpc_id" {
  description = "The ID of the VPC where ECS will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnet IDs for the ECS tasks"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "The security group ID of the Application Load Balancer"
  type        = string
}

# ==========================================
# ECS COMPUTE VARIABLES
# ==========================================
variable "container_image" {
  description = "The Docker image URI to deploy"
  type        = string
}

variable "app_port" {
  description = "The port the application listens on inside the container"
  type        = number
  default     = 80
}

variable "cpu" {
  description = "Fargate instance CPU units (1024 = 1 vCPU)"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Fargate instance memory (in MiB)"
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Number of running instances of the task"
  type        = number
  default     = 1
}

# ==========================================
# SECURITY & ROLES
# ==========================================
variable "execution_role_arn" {
  description = "The ARN of the IAM role that allows ECS to pull images and publish logs"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM SSL certificate for HTTPS"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the ALB Target Group"
  type        = string
}
