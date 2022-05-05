resource "aws_s3_bucket" "mytestfrnf05052022" {
  bucket = "my-testfrnf05052022"
  acl    = "private"

  versioning {
    enabled = true
  }
}