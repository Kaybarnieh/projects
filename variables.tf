# VPC Variables
variable "region" {
  default       = "eu-west-2"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "web-subnet-1-cidr" {
  default       = "10.0.0.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "web-subnet-2-cidr" {
  default       = "10.0.1.0/24"
  description   = "Public Subnet 2 CIDR Block"
  type          = string
}

variable "application-subnet-1-cidr" {
  default       = "10.0.2.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}

variable "application-subnet-2-cidr" {
  default       = "10.0.3.0/24"
  description   = "Private Subnet 2 CIDR Block"
  type          = string
}

variable "database-subnet-1-cidr" {
  default       = "10.0.4.0/24"
  description   = "Private Subnet 3 CIDR Block"
  type          = string
}

variable "database-subnet-2-cidr" {
  default       = "10.0.5.0/24"
  description   = "Private Subnet 4 CIDR Block"
  type          = string
}

variable "availability_zone" {
  default       = "eu-west-2a"
  description   = "availability zone for web server"
  type          = string
}

variable "database-snapshot_identifier" {
  default       = "arn:aws:rds:eu-west-2:149580742500:snapshot:kaybee"
  description   = "database snapshot ARN"
  type          = string
}

variable "database-instance_class" {
  default       = "db.t2.micro"
  description   = "database instance type"
  type          = string
}

variable "database-instance-identifier" {
  default       = "database-1-barnieh"
  description   = "database instance identifier"
  type          = string
}

variable "multi-az-deployment" {
  default       = "false"
  description   = "create a standby DB instance"
  type          = bool
}
