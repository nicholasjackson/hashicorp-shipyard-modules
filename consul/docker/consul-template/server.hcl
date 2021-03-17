container "consul_server" {
  image {
    name = var.consul_version
  }
  
  command = ["consul", "agent", "-config-dir=/config"]

  volume {
    source      = "./files/consul_config/server"
    destination = "/config"
  }

  network { 
    name = "network.local"
  }

  port {
    local = "8500"
    remote = "8500"
    host = "8500"
  }
}