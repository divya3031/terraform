variable "vpc_cider" {
 description = "this value is for vpc cider "
 type = string
 default = "10.2.0.0/16"
}

variable "dev_cider" {
 description = "this value is for dev subnet cider "
 type = string
 default = "10.2.0.0/24"
}
variable "devop_cider" {
 description = "this value is for devop subnet cider "
 type = string
 default = "10.2.1.0/24"
}

variable "ami" {
    type = string
  default = "ami-0341aeea105412b57"  
}
 
variable "instancetype" {
    type = string
    default = "t2.micro"
}
