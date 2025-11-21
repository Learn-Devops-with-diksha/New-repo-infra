variable "resource_group_name" {
  description = "The value of the resource group name"
  type = string
}

variable "resource_group_location" {
  description = "The value of the resource group location"
  type = string
}

variable "nic_name" {
  description = "The value of the network interface name"
  type = string
}

variable "virtual_machine-todoapp" {
    description = "The value of the virtaul machine name"
    type = string
  
}

variable "vm-size" {
  description = "The value of virtual machine size"
}

variable "admin_username" {
    description = "The value of the admin username name"
    type = string  
}

variable "admin_password" {
    description = "The value of the admin password"
    type = string
  
}

variable "publisher" { 
}
variable "offer" {
  
}
variable "sku" {
}

variable "image_version" {
  description = "The value of the VM image version"
  type = string
}
 variable "subnet_id" {
   
 }