variable "resource_group_details" {
    type = object({
        name = string
        location = string
    })
}

variable "virtual_network_details" {
    type = object({
        name = string
        address_space = list(string)
    })
  
}

variable "subnet_details" {
    type = object({
        name = list(string)
    })
}
variable "authentication_details" {
    type = object({
        username = string
        password = string
    })
}
variable "publicip" {
    type = object({
        name = string
    })
  
}
variable "Vm_Name" {
    type = object({
        name = string
        vm_size = string
        computer_name = string
        
    })
}
