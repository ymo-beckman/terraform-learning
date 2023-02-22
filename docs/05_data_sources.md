# Data Sources

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform
configuration, or modified by functions.

```hcl
data "aws_ssm_parameter" "dynamodb_CleanupGatingTable_arn" {
  name = "/${var.ssm_prefix}/${var.env_name}/${var.enterprise_name}/shared-infra/dynamodb/CleanupGates_arn"
}

data "aws_ssm_parameter" "shared_batch_queue_arn" {
  name = "/${var.ssm_prefix}/${var.env_name}/${var.enterprise_name}/shared-infra/batch/shared_batch_queue_arn"
}
```

