---
title: Load Balancing with Consul Template and HAProxy
author: Nic Jackson
slug: consul_template
shipyard_version: ">= 0.2.17"
---

This example shows how you can use Consul Template to generate HAProxy configuration
files using Consul's service catalog.

The following items are automatically installed and configured:
* Consul Server
* Downstream Application x1 with HAProxy Sidecar 
* Upstream Application x2