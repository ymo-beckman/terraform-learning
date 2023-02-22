# Demo

We implemented a todo app rest api app, deploy all infrastructures and app with terraform:
1. use docker runtime provide all services
2. deploy a consul cluster
3. deploy a postgresql database
4. save database connection information into consul kv
5. app reading config info from consul kv


```shell
# 1. deploy consul cluster
pushd ../demo/demo_infra

terraform init
terraform plan -out=infra
terraform apply "infra"

popd

# 2. deploy postgresql
pushd demo/demo_database

terraform init
terraform plan -out=db
terraform apply "db"

popd

# 3. deploy app
pushd demo/app

mvn package -Dmaven.test.skip=true
docker build -t demo-todo-app .

terraform init
terraform plan -out=app
terraform apply "app"

popd
```