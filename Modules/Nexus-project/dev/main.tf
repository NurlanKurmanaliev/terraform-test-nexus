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
    # ami_id = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    subnet_id = module.vpc.subnet
    region = var.region
    aws_security_group_ids = [aws_security_group.allow_tls.id]
    
}