locals{
    ami= data.aws_ami.joindevops.id
    common_tags = merge({project = var.project},{environment = var.environment})
}