module "Virtual_machine" {
        resource_group_details = {
            name = "modulefromterraform"
            location = "Uk South"
        }
        virtual_network_details = {
            name = "Vnet"
            address_space = ["10.0.0.0/16"]
        }
        subnet_details = {
            name = ["10.0.0.0/24"]
        }
        authentication_details = {
            username = "venkatareddy"
            password = "15A91a35333537"
        }
        publicip = {
            name = "public_ip"
        }
        Vm_Name = {
            name = "Ansible"
            vm_size = "Standard_B1s"
            computer_name = "Ubuntu"

        }
  
}