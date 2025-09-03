variable region {
    type = string
    description = "Provide region"
}

variable vpc_cidr {
    type = string
    description = "Provide vpc cidr block"
}

variable subnet_cidrs {
  type = list(string)
  description = "List of CIDR blocks for the subnets"
}

variable azs {
  type = list(string)
  description = "List of Availability Zones for the subnets"
}


variable ip_on_launch {
    type = bool
}

variable instance_type {
    type = string
}



