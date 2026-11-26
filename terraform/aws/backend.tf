terraform {
  backend "s3" {
    # Provide via -backend-config flags or environment variables.
    # Example:
    #   terraform init \
    #     -backend-config="bucket=tfstate-claudecode-<account_id>" \
    #     -backend-config="key=aws/terraform.tfstate" \
    #     -backend-config="region=us-east-1" \
    #     -backend-config="dynamodb_table=tfstate-lock-claudecode"
    bucket         = "tfstate-claudecode-ACCOUNT_ID"
    key            = "aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-lock-claudecode"
    encrypt        = true
  }
}
