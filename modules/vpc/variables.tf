variable "vpc_name" {
  description = "The name of the VPC to create. Will be added to VPC tags"
}
variable "region" {
  description = "The AWS Region to operate in"
  default = "eu-west-1"
}
variable "vpc_cidr" {
  description = "The main VPC CIDR range"
}
variable "public_cidrs" {
  description = "A list of CIDR ranges for use in public subnets"
  type        = list
}
variable "private_cidrs" {
  description = "A list of CIDR ranges for use in private subnets"
  type        = list
}
