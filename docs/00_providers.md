# Providers

Terraform relies on plugins called providers to interact with cloud providers, SaaS providers, and other APIs.
Terraform configurations must declare which providers they require so that Terraform can install and use them.
Additionally, some providers require configuration (like endpoint URLs or cloud regions) before they can be used.

## What Providers Do
- Resource types
- Data sources

## Where Providers Come From
[Terraform Registry](https://registry.terraform.io/browse/providers) is the main directory of publicly available
Terraform providers, and hosts providers for most major infrastructure platforms

## How to Use Providers
- Provider Requirements
- Provider Configuration
- Dependency Lock File

