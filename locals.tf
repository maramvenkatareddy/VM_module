/*                        When To Use Local Values
Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values. */

locals {
  ssh = "allowssh"
  http = "allowhttp"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  destination_port_range_1 = "*"
  source_address_prefix = "*"
  destination_address_prefix = "*"
  inbound = "Inbound"
  priority = 310
  access = "Allow"
  destination_port_range_http = "80"
  priority_http = 320
  priority_http_1 = 330
}
