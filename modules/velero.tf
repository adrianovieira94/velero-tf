resource "kubernetes_secret" "cloud-creditials" {
  # depends_on = [ kubernetes_namespace.velero ]
  metadata {
    name      = "cloud-creditials"
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

resource "helm_release" "velero" {
  name             = "velero"
  repository       = "https://vmware-tanzu.github.io/helm-charts"
  chart            = "velero"
  namespace        = "velero"
  create_namespace = true

  set {
    name  = "configuration.backupStorageLocation[0].name"
    value = "default"
  }

  set {
    name  = "configuration.backupStorageLocation[0].provider"
    value = "aws"
  }

  set {
    name  = "configuration.backupStorageLocation[0].bucket"
    value = var.bucket_name
  }

  set {
    name  = "configuration.backupStorageLocation[0].config.region"
    value = "sa-east-1"
  }

  set {
    name  = "configuration.volumeSnapshotLocation[0].name"
    value = "default"
  }

  set {
    name  = "configuration.volumeSnapshotLocation[0].provider"
    value = "aws"
  }

  set {
    name  = "configuration.volumeSnapshotLocation[0].config.region"
    value = var.region
  }

  set {
    name  = "initContainers[0].name"
    value = "velero-plugin-for-aws"
  }

  set {
    name  = "initContainers[0].image"
    value = "velero/velero-plugin-for-aws:v1.10.0"
  }

  set {
    name  = "initContainers[0].volumeMounts[0].mountPath"
    value = "/target"
  }

  set {
    name  = "initContainers[0].volumeMounts[0].name"
    value = "plugins"
  }


  set {
    name  = "securityContext.fsGroup"
    value = "65534"
  }

  set {
    name  = "nodeAgent.useNodeAgent"
    value = "true"
  }
}
resource "null_resource" "velero_schedules" {
  provisioner "local-exec" {
    command = "sh ./modules/schedules.sh"
  }
}