container "upstream_1" {
  image {
    name = "nicholasjackson/fake-service:v0.2.0"
  }
  
  volume {
    source      = data("upstream")
    destination = "/data"
  }

  network { 
    name = "network.local"
  }

  env_var = {
    "NAME" = "downstream"  
  }
}

sidecar "upstream_agent_1" {
  target = "container.upstream_1"
  
  command = ["consul", "agent", "-config-dir=/config"]
  
  image {
    name = var.consul_version
  }

  volume {
    source      = "./files/consul_config/upstream"
    destination = "/config"
  }
}

container "upstream_2" {
  image {
    name = "nicholasjackson/fake-service:v0.2.0"
  }
  
  volume {
    source      = data("upstream")
    destination = "/data"
  }

  network { 
    name = "network.local"
  }

  env_var = {
    "NAME" = "downstream"  
  }
}

sidecar "upstream_agent_2" {
  target = "container.upstream_2"
  
  command = ["consul", "agent", "-config-dir=/config"]
  
  image {
    name = var.consul_version
  }

  volume {
    source      = "./files/consul_config/upstream"
    destination = "/config"
  }
}

#sidecar "downstream_template" {
#  target = "container.downstream"
#  
#  image {
#    name = var.consul_template_version
#  }
#
#  command = ["envoy", "-c", "/config/envoy.yaml"]
#
#  volume {
#    source      = "./envoyconfig.yaml"
#    destination = "/config/envoy.yaml"
#  }
#}