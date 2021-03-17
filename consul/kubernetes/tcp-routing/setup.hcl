network "dc1" {
  subnet = "10.5.0.0/16"
}

k8s_cluster "dc1" {
  driver  = "k3s"
  version = "v1.0.1"

  nodes = 1

  network {
    name = "network.dc1"
  }
}

module "monitoring" {
  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules//monitoring"
  #source = "../../modules/monitoring"
}

module "consul" {
  # This dependency is only to ensure we do not overload the k8s cluster by 
  # creating too many resources at once.
  depends_on = ["module.monitoring"]

  source = "github.com/nicholasjackson/hashicorp-shipyard-modules/modules//consul"
  #source = "../../modules/consul"
}

k8s_config "app" {
  depends_on = ["module.monitoring"]

  cluster = "k8s_cluster.dc1"
  paths = [
    "./config/k8s_config",
  ]

  wait_until_ready = true
}