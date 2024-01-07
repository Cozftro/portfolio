### S3
locals {
  backend_s3_tags = {
    Name   = var.bucket.name
  }
}

resource "aws_s3_bucket" "backend" {
  bucket = var.bucket.name
  tags   = merge(local.backend_s3_tags)
}

resource "aws_s3_bucket_public_access_block" "backend" {
  bucket = aws_s3_bucket.backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_server_side_encryption_configuration" "backend" {
  bucket = aws_s3_bucket.backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
