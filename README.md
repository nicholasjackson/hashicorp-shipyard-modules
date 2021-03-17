# Shipyard Blueprints for HashiCorp Applications

## Examples

## TCP Routing with Consul Service Mesh on Kubernetes
[./consul/kubernetes/consul-template](./consul/kubernetes/consul-template)

This simple example shows how to connect two services using Consul Service Mesh 
on Kubernetes.

## Load balancing with HAProxy and Consul Template
[./consul/docker/consul-template](./consul/docker/consul-template)

This simple example shows how to load balance upstream services using Consul Template 
and HAProxy.

## Modules
### Consul Service Mesh Kubernetes 
[./modules/kubernetes/consul](./modules/kubernetes/consul)

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
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules/kubernetes//consul"
}
```

### Vault Kubernetes 
[./modules/kubernetes/vault](./modules/kubernetes/vault)

This module installs and configures Vault using the HashiCorp Helm chart in 
`dev` mode.

#### Use

```javascript
// name of the k8s cluster to install module to
variable "vault_k8s_cluster" {
  default = "dc1"
}

module "vault" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules/kubernetes//vault"
}
```

### Monitoring Kubernetes 
[./modules/kubernetes/monitoring](./modules/kubernetes/monitoring)

This module installs Grafana, Loki, and Prometheus to the specified
kubernetes cluster

#### Use

```javascript
// name of the k8s cluster to install module to
variable "monitoring_k8s_cluster" {
  default = "dc1"
}

module "monitoring" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules/kubernetes//monitoring"
}
```

### SMI Controller 
[./modules/kubernetes/smi-controller](./modules/kubernetes/smi-controller)

This module installs cert manager and a SMI controller to the specified
Kubernetes cluster

#### Use

```javascript
// name of the k8s cluster to install module to
variable "smi_controller_k8s_cluster" {
  default = "dc1"
}

module "smi_controller" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules/kubernetes//smi-controller"
}
```