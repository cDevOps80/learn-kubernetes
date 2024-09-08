provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "example" {
  name       = "chaitu-nginx"
  chart      = "./charts/nginx"
  upgrade_install = true

  set {
    name  = "Image.name"
    value = "nginx:1.24.0"
  }

}