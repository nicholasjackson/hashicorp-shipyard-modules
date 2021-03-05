---
id: summary
title: Summary
sidebar_label: Summary
---

In this tutorial you have learned how you can configure Kubernetes deployments to route TCP traffic over
Consul service mesh.

Enabling service mesh for your pods is as easy as adding a simple annotation:

```yaml
annotations:
  "consul.hashicorp.com/connect-inject": "true"
```

Connecting services is as simple, and can be done by adding a second annotation:

```yaml
annotations:
  "consul.hashicorp.com/connect-inject": "true"
  "consul.hashicorp.com/connect-service-upstreams": "payments:9091"
```

Consul has many more advanced features, for more information please see the Consul website [https://www.consul.io/](https://www.consul.io/)

## Further experimentation

To experiment further with this environment you can run the following command to set environment variables `KUBECONFIG` and `CONSUL_HTTP_ADD`, to 
access the Kubernetes cluster and Consul Server.

```shell
eval $(shipyard env)
```

## Shutdown the demo

To shutdown the demo environment and remove all created resources, you can run the following command:

```shell
shipyard destroy
```