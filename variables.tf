variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Profile to use from ~/.aws/credentials"
  default     = "default"
}

variable "aws_account_id" {}

variable "availability_zones" {
  description = "The availability zones"
  default     = ["us-east-1b", "us-east-1c", "us-east-1d"]
  type        = "list"
}

variable "dns_root" {
  description = "The domain or subdomain to create names in"
  default     = "aws.example.com"
}

variable "dns_zone_id" {
  description = "The AWS identifier for the hosted zone to add names to"
}

variable "ecs_cluster_name" {
  description = "The name of the Amazon ECS cluster."
  default     = "default"
}

variable "ssh_key_name" {
  description = "Existing ec2 SSH key to launch instances with."
}

variable "ssl_certificate_id" {
  description = "Existing SSL cert from acm"
}

/* 2017.03.f per http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html */
/* ECS optimized AMIs per region */
variable "amis" {
  default = {
    us-east-1      = "ami-9eb4b1e5"
    us-east-2      = "ami-1c002379"
    us-west-1      = "ami-4a2c192a"
    us-west-2      = "ami-1d668865"
    eu-west-1      = "ami-8fcc32f6"
    eu-west-2      = "ami-cb1101af"
    eu-central-1   = "ami-0460cb6b"
    ap-northeast-1 = "ami-b743bed1"
    ap-southeast-1 = "ami-9d1f7efe"
    ap-southeast-2 = "ami-c1a6bda2"
    ca-central-1   = "ami-b677c9d2"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

/* TODO: go back to creating a key */
variable "key_name" {
  description = "The name of an aws ssh key that already exists."
  default     = ""
}

variable "key_file" {
  description = "The ssh public key for using with the cloud provider."
  default     = ""
}

/* TODO: This should go away, or be optional. */
variable "s3_jenkins_backup" {
  description = "bucket/path to use to populate jenkins_home"
}

variable "s3_bucket_base_key" {
  description = "namespace like aws.example.com to prevent bucket name collisions. Specific keys will be prepended"
}

variable "webapp_names" {
  description = "comma delimited list of the ECR repos to create"
  default     = ["webapp"]
  type        = "list"
}

variable "stack_prefix" {
  description = "This prefix will be attached to all named resources to prevent collision"
}
