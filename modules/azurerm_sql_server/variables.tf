variable "sql_server_name" {
    description = "The name of SQL Server"
 type =  string
}

variable "resource_group_name" {
    description = "The name of the resource group where the sql server will be created"
    type = string
  
}

variable "resource_group_location" {
    description = "The location of resource group where the server will be created"
    type = string
  
}


variable "administrator_login" {
    description = "The admin login of SQL server"
    type= string  
}

variable "administrator_login_password" {
    description = "The admin login Password of SQL server"
    type = string
    sensitive = true
  
}