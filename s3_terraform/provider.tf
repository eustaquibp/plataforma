provider "aws" {
  region = var.aws_region
    assume_role {
    role_arn     = var.account_role 
    session_name = "AWS_TERRAFORM_MGR_ADQ"
  }
}
