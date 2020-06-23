## Quick-Start

This project is an example project, and as such relies on local terraform state, rather than storing it externally
in s3.    To get up and running - perform the following steps:

 - Check `main.tf` and `variables.tf` to satisfy yourself with the configuration
 - run `terraform init`
 - run `terraform plan`
 - run `terraform apply`


# VPC network configuration:

The overall IP Space allocated for this example VPC will be `192.168.0.0/21`, providing capacity for around 2000 discreet IP addresses across 2 tiers, with space to for future expansion

The table below describes the network allocations for the example VPC, as well as tier, intended use, and available addresses

|Tier|Tier Allocation|AZ-A|AZ-B|AZ-C|Future Reservation|Usable capacity|Notes|
|:---|:-------------:|:--:|:--:|:--:|:----------------:|:-------------:|:----|
|Public|`192.168.0.0/22`|`192.168.0.0/24`|`192.168.1.0/24`|`192.168.2.0/24`|`192.168.3.0/24`|1012|Usable capacity appears lower as reservation of the aws `.2` resolver is taken into account|
|Private|`192.168.4.0/22`|`192.168.4.0/24`|`192.168.5.0/24`|`192.168.6.0/24`|`192.168.7.0/24`|1012|Number appears lower as reservation of the aws `.2` resolver is taken into account|

## Extending this example further

There are some design considerations that aren't in scope for a quick example repository.  To keep the time spent on this low, I've included them in `TODO.md`

