service {
  name = "downstream"
  id = "downstream-v1"
  port = 9090


  check {
    id = "downstream",
    name = "HTTP API on port 9090"
    http = "http://localhost:9090/health"
    interval = "10s"
    timeout = "1s"
  }
}