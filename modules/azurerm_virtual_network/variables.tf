variable "virtual_network_name" {
    description = "The name of Virtual network"
    type = string
}

variable "virtual_network_location" {
    description = "The location of the Virtual network"
    type = string
}

variable "resource_group_name" {
    description = "The name of the resource group where the virtual network will be created."
    type = string
} 

variable "address_space" {
    description = "The address space of the Virtual network"
    type = list(string)
}