
resource "null_resource" "velero_install" {
  provisioner "local-exec" {
    command = <<EOT
      velero install \
        --provider aws \
        --plugins velero/velero-plugin-for-aws:v1.10.0 \
        --bucket ${aws_s3_bucket.s3_bucket.id} \
        --backup-location-config region=${var.region} \
        --snapshot-location-config region=${var.region} \
        --secret-file=${var.secret_file}
    EOT
  }
}