provider "aws" {
  region = "us-west-2"
}

variable "key_name" {
  default = "cdorros_aws"
}

/* **********************************
   Subnets / VPC
   ******************************* */
# TF doesn't allow double interpolation, so we sadly
# can't use the networks.tf file for this one :(
#
variable "vpc_id" {
  default = "vpc-cc325aa9"
}

variable "avail_zone_primary" {
  default = "public_a"
}
variable "avail_zone_secondary" {
  default = "public_b"
}

# TF doesn't allow double interpolation, so we sadly
# can't use the networks.tf file for this one :(
#
# Subnet IDs
variable "subnets" {
    description = "eng-d1 usw1 subnet IDs by avail zone"
    default = {
        public_a = "subnet-fd69f18a"
        public_b = "subnet-16a1db73"
    }
}
