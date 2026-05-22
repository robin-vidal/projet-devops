# secrets injected via TF_VAR_ in CI
env               = "dev"
project           = "gitea-forge-aws"
aws_region        = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
ecs_cpu           = 256
ecs_memory        = 512
ecs_desired_count = 1
db_instance_class = "db.t3.micro"
db_name           = "gitea"
log_retention_days = 14
