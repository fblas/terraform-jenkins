variable "instance_name" {
  description = "Name ec2 instance"
  type        = string
  default     = "demoInstance" 
}

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-0f5fcdfbd140e4ab7" # amazon Linux
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}
