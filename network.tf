resource "azurerm_virtual_network" "my_vnet" {
    name                    =   var.virtual_network_details.name
    resource_group_name     =   var.resource_group_details.name
    address_space           =   var.virtual_network_details.address_space
    location                =   var.resource_group_details.location 

    depends_on = [
      azurerm_resource_group.resg
    ]

}
resource "azurerm_subnet" "subnet" {
    name                    = var.subnet_details.name
    resource_group_name     = var.resource_group_details.name
    virtual_network_name    = var.virtual_network_details.name     
    address_prefixes        = var.subnet_details.address_prefixes


    depends_on = [
      azurerm_virtual_network.my_vnet
    ]

}
resource "azurerm_public_ip" "publicip" {
    name = var.publicip
    location = var.resource_group_details.location
    resource_group_name = var.resource_group_details.name
    allocation_method = "Dynamic"
    depends_on = [
      azurerm_resource_group.resg
    ]
}

resource "azurerm_network_interface" "NIC" {
    name = "nic"
    location = var.resource_group_details.location
    resource_group_name = var.resource_group_details.name
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Static"
      public_ip_address_id = azurerm_public_ip.publicip.id
    }
    depends_on = [
      azurerm_public_ip.publicip,
      azurerm_virtual_network.my_vnet,
      azurerm_subnet.subnet
    ]
}
resource "azurerm_network_interface_security_group_association" "nic_id" {
    network_interface_id = azurerm_network_interface.NIC.id
    network_security_group_id = azurerm_network_security_group.webnsg.id

    depends_on = [
      azurerm_network_interface.NIC,
      azurerm_network_security_group.webnsg
    ]
}