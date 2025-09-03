# terraform-test-nexus
```hcl
vpc_cidr = "10.0.0.0/16"
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
region = "us-east-1"
ip_on_launch = true
instance_type = "t2.medium" 


```