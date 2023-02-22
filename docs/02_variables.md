# Variables

- Input Variables: serve as parameters for a Terraform module, so users can customize behavior without editing the source.
- Output Values: are like return values for a Terraform module.
- Local Values: are a convenience feature for assigning a short name to an expression.


## Input Variables

### definition
```hcl
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```

### using input variable values
```hcl
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.image_id
}
```

### Assigning values
- with the "-var" command line
  - ```shell
    terraform apply -var="image_id=ami-abc123"
    terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
    terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
    ```
- In variable deinitions (.tfvars or .json) files
  - ```shell
    terraform apply -var-file="testing.tfvars"
    ``` 
  - ```
    image_id = "ami-abc123"
    availability_zone_names = [
      "us-east-1a",
      "us-west-1c",
    ]
    ```
  - ```json
    {
      "image_id": "ami-abc123",
      "availability_zone_names": ["us-west-1a", "us-west-1c"]
    }
    ```
- Environment Variables
    - ```shell
      export TF_VAR_image_id=ami-abc123
      export TF_VAR_availability_zone_names='["us-west-1b","us-west-1d"]'
      terraform plan
      ```
- Load variables order
  - Environment variables
  - terraform.tfvars
  - terraform.tfvars.json
  - *.auto.tfvars or *.auto.tfvars.json
  - -var and -var-file

    
## Output values

### Declaring an Output Value
```hcl
output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."
}

# sensitive
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}

# Child Module Output
module "foo" {
  source = "./mod"
}


resource "test_instance" "x" {
  some_attribute = module.foo.a # resource attribute references a sensitive output
}

# Explicit Output Dependencies
output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."

  depends_on = [
    # Security group rule must be created before this IP address could
    # actually be used, otherwise the services will be unreachable.
    aws_security_group_rule.local_access,
  ]
}
```

## Local Values
A local value assigns a name to an expression, so you can use the name multiple times within a module instead of
repeating the expression.

### Declaring a Local Value
```hcl
locals {
  # Ids for multiple sets of EC2 instances, merged together
  instance_ids = concat(aws_instance.blue.*.id, aws_instance.green.*.id)
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
```

### Using Local Values
```hcl
resource "aws_instance" "example" {
  # ...

  tags = local.common_tags
}
```