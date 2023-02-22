# Backend Configuration

- A backend defines where Terraform stores its state data files(.terraform/terraform.tfstate).
- Terraform uses persisted state data to keep track of the resources it manages.
- This lets multiple people access the state data and work together on that collection of infrastructure resources.

## Available Backends
 - local
 - s3
 - azurerm
 - consul
 - gcs
 - remote
 - http
 - Kubernetes
 - oss
 - pg


### local

```hcl
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

### s3
```hcl
terraform {
  backend "s3" {
    bucket          = "mybucket"
    key             = "path/to/my/key"
    region          = "us-east-1"
    dynamodb_table  = "terraform-lock-table"
  }
}
```

Terraform will need the following AWS IAM permissions on the target backend bucket:
- s3:ListBucket on arn:aws:s3:::mybucket
- s3:GetObject on arn:aws:s3:::mybucket/path/to/my/key
- s3:PutObject on arn:aws:s3:::mybucket/path/to/my/key
- s3:DeleteObject on arn:aws:s3:::mybucket/path/to/my/key

DynamoDB locking table Permissions (arn:aws:dynamodb:::table/locking_table):
- dynamodb:DescribeTable
- dynamodb:GetItem
- dynamodb:PutItem
- dynamodb:DeleteItem


### Configuration
- File: backend configuration file
  - ```
    address = "demo.consul.io"
    path    = "example_app/terraform_state"
    scheme  = "https"
    ```
- Command-line key/value pairs: -backend-config="KEY=VALUE"
- Interactively: Terraform will interactively ask you for the required values, unless interactive input is disabled. Terraform will not prompt for optional values.

### aws credentials and Shared Configuration
- ~/.aws/credentials
- variables
  - AWS_DEFAULT_REGION and AWS_REGION
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY
  - ...


### multi-account aws, workspace

#### account setup
```hcl
variable "workspace_iam_roles" {
  default = {
    staging    = "arn:aws:iam::STAGING-ACCOUNT-ID:role/Terraform"
    production = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/Terraform"
  }
}

provider "aws" {
  # No credentials explicitly set here because they come from either the
  # environment or the global credentials file.

  assume_role = {
    role_arn = "${var.workspace_iam_roles[terraform.workspace]}"
  }
}
```

#### Creating and Selecting Workspaces
switch workspace:
```shell
$ terraform workspace new staging
Created and switched to workspace "staging"!

$ terraform workspace new production
Created and switched to workspace "production"!
```
