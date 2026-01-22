cluster_name        = "fiapx-cluster"
aws_region          = "us-east-1"
cluster_version     = "1.34"
vpc_cidr            = "10.0.0.0/16"
public_subnets      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
node_instance_type  = "t3.small"
node_min_size       = 1
node_max_size       = 3
node_desired_size   = 2
enable_external_secrets = true
enable_istio            = true

# -- New Relic & RabbitMQ Settings --
enable_newrelic      = false
newrelic_license_key = "YOUR_NEW_RELIC_LICENSE_KEY" # <-- CHANGE THIS

enable_rabbitmq      = false
rabbitmq_username    = "user"
rabbitmq_password    = "CHANGE_ME_PLEASE" # <-- CHANGE THIS
