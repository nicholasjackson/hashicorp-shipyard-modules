docs "docs" {
  path  = "./docs"
  port  = 18080
  open_in_browser = true

  index_title = "Consul"
  index_pages = [ 
    "index",
    "adding_services",
    "linking_services",
    "summary",
  ]

  network {
    name = "network.dc1"
  }
}

container "tools" {
  image   {
    name = "shipyardrun/tools:latest"
  }
  
  network {
    name = "network.dc1"
  }

  command = ["tail", "-f", "/dev/null"]

  # Working files
  volume {
    source      = "./files"
    destination = "/files"
  }

  # Shipyard config for Kube 
  volume {
    source      = k8s_config_docker("dc1")
    destination = "/root/.config/kubeconfig.yaml"
  }
  
  env {
    key = "KUBECONFIG"
    value = "/root/.config/kubeconfig.yaml"
  }
  
  env {
    key = "HOST"
    value = shipyard_ip()
  }
}