locals {
  # Get workspace configuration variables
  config = yamldecode(file("${path.module}/config/${terraform.workspace}.yaml"))
}

resource "aws_db_instance" "writer_instance" {
  engine                          = "mysql"
  identifier                      = "nops-${terraform.workspace}-rds-2"
  db_subnet_group_name            = local.config.rds_subnet_group
  instance_class                  = local.config.db_instance_class
  publicly_accessible             = true
  tags = {
    "CostUnit"      = "Nops"
    "owner"         = "dev@nclouds.com"
    "workload-type" = "other"
  }
  monitoring_interval             = local.config.monitoring_interval
  enabled_cloudwatch_logs_exports = local.config.cloudwatch_logs_exports
  
  deletion_protection             = local.config.deletion_protection
  skip_final_snapshot             = true
}

resource "aws_db_instance" "reader_instance" {
  count                               = terraform.workspace == "prod" ? 1 : 0
  identifier                          = "nops-${terraform.workspace}-rds-2-read-replica-0"
  db_subnet_group_name                = local.config.rds_subnet_group
  instance_class                      = "db.t2.small"
  replicate_source_db                 = aws_db_instance.writer_instance.id
  publicly_accessible                 = true
  copy_tags_to_snapshot               = true
  enabled_cloudwatch_logs_exports     = local.config.cloudwatch_logs_exports
  iam_database_authentication_enabled = true
  skip_final_snapshot                 = true
}


