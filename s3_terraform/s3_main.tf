resource "aws_s3_bucket" "s3-transvv" {
  bucket 	= "${lower(var.environment)}-${var.bucket_name}-transvv"
  acl    	= "private"
  region 	= var.aws_region
  force_destroy = true
  tags = {
    IaC         = var.iac
    Environment = var.environment
    Squad       = var.equipe
    Projeto     = var.project
}

  versioning {
  enabled = true
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
}
}
/*
resource "aws_s3_bucket_notification" "transvv-trigger" {
  bucket = "${lower(var.environment)}-${var.bucket_name}-transvv"
  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda-emr.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.prefix
    filter_suffix       = var.suffix
  }
}
*/
resource "aws_s3_bucket_object" "s3_transvv_input"{
  bucket = "${lower(var.environment)}-${var.bucket_name}-transvv"
  key    = "int/input/transvv/BucketCriado.tf"
  force_destroy = true
  depends_on =[aws_s3_bucket.s3-transvv]
}

resource "aws_s3_bucket_object" "s3_transvv_output" {
  bucket = "${lower(var.environment)}-${var.bucket_name}-transvv"
  key    = "int/output/transvv/BucketCriado.tf"
  force_destroy = true
  depends_on =[aws_s3_bucket.s3-transvv]
}

resource "aws_s3_bucket_object" "s3_transvv_log" {
  bucket = "${lower(var.environment)}-${var.bucket_name}-transvv"
  key    = "int/log/BucketCriado.tf"
  force_destroy = true
  depends_on =[aws_s3_bucket.s3-transvv]
}

