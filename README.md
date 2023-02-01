# AusSRC services

Infrastructure as code for AusSRC services using Terraform. Deploy long running services to Nimbus (OpenStack) on Pawsey.

## Setup

You will need a Pawsey account. This requires an `.openrc.sh` file which sets environment variables for accessing Nimbus. Create a `terraform.rc` file containing credentials as environment variables:

```
export OS_USERNAME=<username>
export OS_PASSWORD=<password>
```

You can set these with `source terraform.rc`. Then you will be able to deploy these resources. To view state and/or apply changes:

```
terraform plan
terraform apply
```

## Services

### WALLABY_events

