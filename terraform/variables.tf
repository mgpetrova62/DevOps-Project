variable "region" {
  description = "The AWS region to deploy to"
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "The size of the server"
  default     = "t3.micro"
}