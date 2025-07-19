locals{
    ami= data.aws_ami.RHEL9.id
    common_tags = merge(var.project,var.environment,{
        Name = "docker"
    })
}