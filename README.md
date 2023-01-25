# AusSRC services

Infrastructure as code for AusSRC services using Terraform. Deploy long running services to Pawsey.

## Setup

You will need a Pawsey account. Create a `terraform.rc` file containing credentials as environment variables:

```
export OS_USERNAME=<username>
export OS_PASSWORD=<password>
```

You can set these with `source terraform.rc`. Then you will be able to deploy these resources. To view:

```
terraform plan
```

And then once you're happy with the services to be deployed run:

```
terraform apply
```