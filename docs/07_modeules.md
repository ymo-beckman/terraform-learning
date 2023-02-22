# Modules

- Root module
- Child modules
- Using modules


## Calling a child module
```hcl
module "servers" {
  source = "./app-cluster"

  servers = 5
}
```

## Module sources
- Local paths
- Terraform Registry
- Github
- Bitbucket
- Git
- Http URLs
- S3 buckets
- Modules in Package Sub-directories
