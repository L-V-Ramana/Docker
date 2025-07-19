locals{
    ami= data.aws_ami.RHEL9.id
    common_tags = merge(var.var.project,var.environment,{
        name ="docker"
    })
}