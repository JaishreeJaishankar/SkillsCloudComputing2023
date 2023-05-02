variable "snapshot_arn" {
  type        = string
  description = "ARN of MySQL DB with the schema intalled"
}

variable "vpc_id" {
  type = string
}

variable "db_paramters" {
  type        = map(string)
  description = "Map of DB configuration parameters for MySQL DB"
}

variable "private_subnets" {
  type        = list(string)
  description = "The list of private subnets to host the DB instance"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "The list of public subnet cidr blocks to allow access to the DB instance"
}