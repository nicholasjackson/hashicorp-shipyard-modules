# Shipyard Blueprints for HashiCorp Applications

## Modules
### Consul Service Mesh Kubernetes ./modules/consul

This module installs and configures Consul Service Mesh using the HashiCorp
Helm chart with CRDs enabled.

To enable monitoring use this chart in combination with the monitoring module.

#### Use

```javascript
// name of the k8s cluster to install module to
variable "consul_k8s_cluster" {
  default = "dc1"
}

module "consul" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules//consul"
}
```

### Vault Kubernetes ./modules/vault

This module installs and configures Vault using the HashiCorp Helm chart in 
`dev` mode.

#### Use

```javascript
// name of the k8s cluster to install module to
variable "vault_k8s_cluster" {
  default = "dc1"
}

module "vault" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules//vault"
}
```

### Monitoring Kubernetes ./modules/monitoring

This module installs Grafana, Loki, and Prometheus to the specified
kubernetes cluster

#### Use

```javascript
// name of the k8s cluster to install module to
variable "monitoring_k8s_cluster" {
  default = "dc1"
}

module "monitoring" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules//monitoring"
}
```