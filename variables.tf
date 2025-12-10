variable "instance_name" {
  description = "Name ec2 instance"
  type        = string
  default     = "demoInstance" 
}

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-05c13eab67c5d8861" # amazon Linux
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}
