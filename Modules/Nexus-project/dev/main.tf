provider aws {
    region = var.region
}

module vpc {
    source = "../vpc"
    vpc_cidr = var.vpc_cidr
    subnet_cidrs = var.subnet_cidrs
    azs = var.azs
    ip_on_launch = var.ip_on_launch 
    region = var.region
    
}


module ec2 {
    source = "../ec2"
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet
    region = var.region
    sg_id = module.sg.sg_id
}

module sg {
    source = "../sg"
    vpc_id = module.vpc.vpc_id

}