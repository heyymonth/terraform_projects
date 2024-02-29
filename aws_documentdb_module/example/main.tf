provider "aws" {
#  shared_credentials_file = "~/.aws/credentials"
#  profile                 = "default"
  region                  = "ap-south-1"
}


module "document_db_cluster" {
  source          = "../terraform-aws-aws-documentdb-cluster/"
  enabled         = true
  name            = "test-doc-db"
  master_username = "testuser"
  master_password = var.master_password
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  subnet_ids      = ["subnet-086c91a642bdccd6c", "subnet-044a7741f82a3afd7", "subnet-0200109394786650b", ]
  enabled_cloudwatch_logs_exports = ["audit"]
  storage_encrypted      = false
  vpc_security_group_ids = ["sg-0a132ed30da85c108"]
  skip_final_snapshot    = true
  tags = {
    Environment  = "terraform-test"
    "created by" = "DevOps"
  }
  parameter       = var.parameter
}
