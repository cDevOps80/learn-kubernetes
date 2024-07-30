terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

data "kubectl_file_documents" "docs" {
  content = file("sample.yaml")
}

resource "null_resource" "one" {
  count = length(data.kubectl_file_documents.docs.documents)
  provisioner "local-exec" {

    command = "echo This is chaithanya"
  }
}


