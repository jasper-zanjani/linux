# Terraform

The workflow associated with Terraform is to create a **plan** and then to **apply** it.
The infrastructure created can also be destroyed with **terraform destroy**.


Many providers are available for Terraform, but most of them are cloud-based.
There do appear to be providers available for TrueNAS, Hyper-V, and [libvirt](https://dev.to/ruanbekker/terraform-with-kvm-2d9e).
There is also a [null resource provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)

There are various tiers of providers: official, partner, and community.  

##### Provisioners

**Provisioners** model specific actions in order to prepare servers or other infrastructure objects for service.
Provisioners are described as a last resort in Terraform documentation because their actions cannot be modeled as part of a plan.

[**local-exec**](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) invokes a local executable.

```hcl
provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
}
```

## Tasks

#### Configuration
:   
    Terraform configurations are written in JSON or (more commonly) [HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration).

#### Local labbing
:   
    