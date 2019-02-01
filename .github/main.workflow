workflow "Test k8s deployment with helm" {
  on = "push"
  resolves = ["deploy to k8s"]
}

action "Build image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "build -f Dockerfile.nginx -t p1hub/testactions ."
}

action "Docker Registry" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = [
    "Build image",
  ]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker push" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Docker Registry"]
  args = "push p1hub/testactions"
}

action "deploy to k8s" {
  uses = "./.github/actions/deploy"
  needs = ["Docker push"]
  secrets = ["KUBECONFIG"]
}
