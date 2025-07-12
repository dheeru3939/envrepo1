
module "resource_group" {
  source = "../modules/azurerm_resource_group"
  resource_group_name = "rg-todoapp39"
  resource_group_location = "Australia East"
}

module "resource_group2" {
  source = "../modules/azurerm_resource_group"
  resource_group_name = "rg-101-todoapp"
  resource_group_location = "Australia East"
}

module "resource_group" {
  source = "../modules/azurerm_resource_group"
  resource_group_name = "rg-todoapp3912"
  resource_group_location = "Australia East"
}

module "virtual_network" {
    depends_on = [module.resource_group]
  source = "../modules/azurerm_virtual_network"

  virtual_network_name = "vnet-todoapp39"
  virtual_network_location = "Australia East"
  resource_group_name = "rg-todoapp39"
  address_space = ["10.0.0.0/16"]
}

module "virtual_network1" {
    depends_on = [module.resource_group]
  source = "../modules/azurerm_virtual_network"

  virtual_network_name = "vnet-dhondhu"
  virtual_network_location = "Australia East"
  resource_group_name = "rg-dhondhu"
  address_space = ["10.0.0.0/16"]
}

module "virtual_network2" {
    depends_on = [module.resource_group]
  source = "../modules/azurerm_virtual_network"

  virtual_network_name = "vnet-tondu"
  virtual_network_location = "Australia East"
  resource_group_name = "rg-tondu"
  address_space = ["10.0.0.0/16"]
}

module "frontend_subnet" {
    depends_on = [module.virtual_network]
  source = "../modules/azurerm_subnet"

  resource_group_name = "rg-todoapp39"
  virtual_network_name = "vnet-todoapp39"
  subnet_name = "frontend-subnetdh39"
  address_prefixes = ["10.0.1.0/24"]
}
module "backend_subnet" {
    depends_on = [module.virtual_network]
  source = "../modules/azurerm_subnet"

  resource_group_name = "rg-todoapp39"
  virtual_network_name = "vnet-todoapp39"
  subnet_name = "backend-subnetdh39"
  address_prefixes = ["10.0.2.0/24"]
}

module "public_ip_frontend" {
    source = "../modules/azurerm_public_ip"
    public_ip_name = "pip-todoappdh39-frontend"
    resource_group_name = "rg-todoapp39"
    resource_group_location = "Australia East"
    allocation_method = "Static"
  
}

module "frontend_vm" {
    depends_on = [module.frontend_subnet]
  source = "../modules/azurerm_virtual_machine"
resource_group_name = "rg-todoapp39"
resource_group_location = "Australia East"
vm_name = "vm-frontenddh39"
vm_size = "Standard_B1s"
admin_username = "admindheeru"
admin_password = "Welcome@39verma"
image_publisher = "canonical"
image_offer = "UbuntuServer"
image_sku = "18.04-LTS"
image_version = "latest"
nic_name = "nic-frontendvmdh39"
virtual_network_name = "vnet-todoapp39"
subnet_name = "frontend-subnetdh39"
public_ip_name = "pip-todoappdh39-frontend"
}

 
module "public_ip_backend" {
    source = "../modules/azurerm_public_ip"
    public_ip_name = "pip-todoappdh39-backend"
    resource_group_name = "rg-todoapp39"
    resource_group_location = "Australia East"
    allocation_method = "Static"
  
}

module "backend_vm" {
depends_on = [module.backend_subnet]
source = "../modules/azurerm_virtual_machine"
resource_group_name = "rg-todoapp39"
resource_group_location = "Australia East"
vm_name = "vm-backenddh39"
vm_size = "Standard_B1s"
admin_username = "admindheeru"
admin_password = "Welcome@39verma"
image_publisher = "canonical"
image_offer = "0001-com-ubuntu-server-focal"
image_sku = "20_04-lts"
image_version = "latest"
nic_name = "nic-backendvmdh39"
virtual_network_name = "vnet-todoapp39"
subnet_name = "backend-subnetdh39"
public_ip_name = "pip-todoappdh39-backend"
}


module "sql_server" {
  source = "../modules/azurerm_sql_server"
  sql_server_name = "sqlserver-todoappdh39"
  resource_group_name = "rg-todoapp39"
  resource_group_location = "Australia East"
  administrator_login = "admindheeru"
  administrator_login_password = "Welcome@39verma"

}

# module "sql_database" {
#   source = "../modules/azurerm_sql_database"
#   depends_on = [module.sql_server]
#   sql_database_name = "todo-sqldbdh39"
#   sql_server_id = "/subscriptions/67e984cb-2da5-481d-8e59-4055c393a626/resourceGroups/rg-todoapp39/providers/Microsoft.Sql/servers/sqlserver-todoappdh39"

  
# }