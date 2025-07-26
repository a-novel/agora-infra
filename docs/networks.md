# Network

This page keeps track of the network related information for the project.

## Subnet

The prod environment's VPC use **10.0.0.0/16** as CIDR range which represents 65536 allocatable IPs.

The subnets of the dev environment are defined as following:

| Name                        | CIDR         | Availability Zone | Public? | Description                                  |
| --------------------------- | ------------ | ----------------- | ------- | -------------------------------------------- |
| agorasv-prod-alb-eu-west-3a | 10.0.0.0/28  | eu-west-3a        | yes     | Subnet to host the application load-balancer |
| agorasv-prod-alb-eu-west-3b | 10.0.0.16/28 | eu-west-3b        | yes     | Subnet to host the application load-balancer |
