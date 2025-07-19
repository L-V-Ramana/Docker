locals{
    ami= data.aws_ami.joindevops.id
    common_tags ={
        project = var.project
        environment = var.environment
    }
}
