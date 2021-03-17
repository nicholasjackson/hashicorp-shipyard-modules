variable "consul_version" {
  default = "consul:1.9.4"
}

variable "consul_template_version" {
  default = "hashicorp/consul-template:latest"
}

network "local" {
  subnet = "10.10.0.0/16"
}