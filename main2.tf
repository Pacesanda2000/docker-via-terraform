terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "dmajoros_testimages" {
  name         = "dmajoros/testimages:latest"
  keep_locally = false
}

resource "docker_container" "mycv" {
  image = docker_image.dmajoros_testimages.image_id
  name  = "mycv"
  ports {
    internal = 80
    external = 8004
  }
}

resource "docker_container" "mycv1" {
  image = docker_image.dmajoros_testimages.image_id
  name  = "mycv1"
  ports {
    internal = 80
    external = 8005
  }
}
