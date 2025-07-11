variable "public_ip_name" {
    description = "The name of the public IP address"
    type = string
  
}

variable "resource_group_name" {
    description = "The name of the resource group where the public IP will be created"
    type =   string
}

variable "resource_group_location" {
    description = "The azure location where the public IP will be created"
    type = string
  }

variable "allocation_method" {
    description = "The allocation method where the public Ip. can be 'Static' or 'Dynamic'."
    type = string
    default = "Static"
}

