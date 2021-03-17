service {
  name = "upstream"
  port = 9090


  check {
    name = "HTTP API on port 9090"
    http = "http://localhost:9090/health"
    interval = "10s"
    timeout = "1s"
  }
}