# Terraform

## Infrastructure as Code
- Build
- Change
- Destroy

Terraform's configuration language is declarative, meaning that it describes the desired end-state for your infrastructure, in contrast to procedural programming languages that require step-by-step instructions to perform tasks. Terraform providers automatically calculate dependencies between resources to create or destroy them in the correct order.

To deploy infrastructure with Terraform:
- Scope - Identify the infrastructure for your project.
- Author - Write the configuration for your infrastructure.
- Initialize - Install the plugins Terraform needs to manage the infrastructure.
- Plan - Preview the changes Terraform will make to match your configuration.
- Apply - Make the planned changes.

Track your infrastructure (state):
- Terraform keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.


## Concept:
- Provider
- Configuration
- Resource
- State
- Variable
- Input

## Workflow:
- terraform init
- terraform plan
- terraform apply

## Demo
We implemented a todo app rest api app, deploy all infrastructures and app with terraform:
1. use docker runtime provide all services
2. deploy a consul cluster
3. deploy a postgresql database
4. save database connection information into consul kv
5. app reading config info from consul kv

### Swagger ui of the rest api
![app.png](docs%2Fimg%2Fapp.png)

### The consul cluster
![consul_servers.png](docs%2Fimg%2Fconsul_servers.png)

### database configuration
![db_config_in_consul.png](docs%2Fimg%2Fdb_config_in_consul.png)

### service registry
![service_registry.png](docs%2Fimg%2Fservice_registry.png)