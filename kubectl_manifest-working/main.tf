data "kubectl_file_documents" "docs" {
  content = file("sample.yaml")
}

resource "null_resource" "one" {
  count = length(data.kubectl_file_documents.docs.documents)
  provisioner "local-exec" {

    command = echo "${element(data.kubectl_file_documents.docs.documents, count.index)} - file"
  }
}