resource "kubernetes_secret" "cloud-creditials" {
  depends_on = [ kubernetes_namespace.velero ]
  metadata {
    name = "cloud-creditials"
    namespace = "velero" 
    labels = {
     "component" : "velero"
    }
  }

 data = {    
    credentials = base64encode("[default]\naws_access_key_id=${var.aws_access_key}\naws_secret_access_key=${var.aws_secret_key}")
  }
  type = "Opaque" # Tipo de Secret padrão
}

resource "kubernetes_namespace" "velero" {
  metadata {
    name = "velero"
  }
}


# resource "null_resource" "velero_install" {
#   provisioner "local-exec" {
#     command = <<EOT
#       velero install --provider aws --plugins velero/velero-plugin-for-aws:v1.10.0 --bucket velero-notificacoes-prd --backup-location-config region=sa-east-1 --snapshot-location-config region=sa-east-1 --no-secret
#     EOT
#   }
# }



resource "null_resource" "velero_install" {
  provisioner "local-exec" {
    command = <<EOT
      velero install \
        --provider aws \
        --plugins velero/velero-plugin-for-aws:v1.10.0 \
        --bucket velero-notificacoes-prd \
        --backup-location-config region=sa-east-1 \
        --snapshot-location-config region=sa-east-1 \
        --no-secret
    EOT
  }
}
