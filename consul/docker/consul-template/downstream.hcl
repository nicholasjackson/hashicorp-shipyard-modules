container "downstream" {
  image {
    name = "nicholasjackson/fake-service:v0.2.0"
  }
  
  volume {
    source      = data("downstream")
    destination = "/data"
  }

  network { 
    name = "network.local"
  }

  env_var = {
    "NAME" = "downstream"  
  }
}

sidecar "downstream_agent" {
  target = "container.downstream"
  
  command = ["consul", "agent", "-config-dir=/config"]
  
  image {
    name = var.consul_version
  }

  volume {
    source      = "./files/consul_config/downstream"
    destination = "/config"
  }
}

sidecar "downstream_template" {
  target = "container.downstream"
  
  image {
    name = var.consul_template_version
  }

  command = ["-template", "/files/haproxy_downstream.tmpl:/data/haproxy.cfg"]
  
  volume {
    source      = "./files/consul_config/downstream"
    destination = "/files"
  }

  volume {
    source      = data("downstream")
    destination = "/data"
  }
}

sidecar "downstream_haproxy" {
  target = "container.downstream"
  
  image {
    name = "haproxy"
  }

  volume {
    source      = data("downstream")
    destination = "/usr/local/etc/haproxy/"
  }
  
  max_restart_count = 100
}