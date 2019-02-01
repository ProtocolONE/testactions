workflow "Test k8s deployment with helm" {
  on = "push"
  resolves = [
    "Docker push",
    "curl",
  ]
}

action "Build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -f Dockerfile.nginx -t p1hub/testactions ."
}

action "Docker Registry" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Build image"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker push" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Docker Registry"]
  args = "push p1hub/testactions"
}

action "curl" {
  uses = "curl"
  args = "https://31.25.227.71:6443/api"
}
