variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "fiapx-cluster"
}

variable "aws_region" {
  description = "The AWS region to create the cluster in."
  type        = string
  default     = "us-east-1"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.29"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "node_instance_type" {
  description = "The instance type for the EKS worker nodes."
  type        = string
  default     = "t3.small"
}

variable "node_min_size" {
  description = "The minimum size of the EKS node group."
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "The maximum size of the EKS node group."
  type        = number
  default     = 3
}

variable "node_desired_size" {
  description = "The desired size of the EKS node group."
  type        = number
  default     = 2
}

variable "enable_external_secrets" {
  description = "Flag to enable/disable the External Secrets installation."
  type        = bool
  default     = true
}

variable "enable_istio" {
  description = "Flag to enable/disable the Istio installation."
  type        = bool
  default     = true
}

variable "enable_newrelic" {
  description = "Flag to enable/disable the New Relic installation."
  type        = bool
  default     = false
}

variable "newrelic_license_key" {
  description = "Your New Relic license key."
  type        = string
  default     = ""
  sensitive   = true
}

variable "enable_rabbitmq" {
  description = "Flag to enable/disable the RabbitMQ installation."
  type        = bool
  default     = false
}

variable "rabbitmq_username" {
  description = "The username for RabbitMQ."
  type        = string
  default     = "user"
}

variable "rabbitmq_password" {
  description = "The password for RabbitMQ."
  type        = string
  default     = "bitnami"
  sensitive   = true
}

