terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

#data "kubectl_file_documents" "docs" {
#  content = file("./sample.yaml")
#}

data "kubectl_filename_list" "manifests" {
  pattern = "./*.yaml"
}

resource "null_resource" "two" {
  depends_on = [data.kubectl_filename_list.manifests]
  #count = length(data.kubectl_file_documents.docs.documents)
  count = length(data.kubectl_filename_list.manifests.matches)
  provisioner "local-exec" {

    command = "echo This is chaithanya"
  }
}


