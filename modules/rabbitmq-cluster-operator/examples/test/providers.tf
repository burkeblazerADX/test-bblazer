provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-tpm-demeter-terraform-modules"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "kind-tpm-demeter-terraform-modules"
  }

  # experiments {
  #   manifest = true
  # }
}
