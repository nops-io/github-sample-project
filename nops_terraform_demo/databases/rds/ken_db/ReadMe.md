# RDS

Terraform to deploy uat and prod RDS instances

## Requirements

* [terraform v0.15.1](https://releases.hashicorp.com/terraform/0.15.1/)

## AWS Access

To deploy this configuration you need to have valid AWS credentials configured locally. If using a named profile make sure you have the `AWS_PROFILE` environment variable set before running any terraform commands.

## Terraform workspaces

This project requires a per-workspace configuration file that has all the environment specific variables. The file's location has to be `config/<terraform-workspace>.yaml`. To create a new terraform workspace you can copy the existing configurations from another workspace into a file with your workspace's name.

```
cp config/<existing-workspace>.yaml config/<new-workspace>.yaml

terraform workspace new <new-workspace>
terraform init
```

## Terraform apply/destroy

Because terraform itself looks for any configuration variables based on the select workspace we don't need to pass any variables when running the `apply`, `plan` or `destroy` commands. To perform any of these actions on an environment you just need to select the right workspace.

```
terraform workspace select <workspace-name>
terraform <plan|apply|destroy>
```
