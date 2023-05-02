variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type        = list(string)
  description = "The list of private subnets to host the DB instance"
}

variable "private_subnets" {
  type        = list(string)
  description = "The list of private subnets to host the DB instance"
}

variable "iam_role" {
  type        = string
  description = "iam role name"
}