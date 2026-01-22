resource "helm_release" "rabbitmq" {
  count = var.enable_rabbitmq ? 1 : 0

  name             = "rabbitmq"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "rabbitmq"
  version          = "12.0.3" # Example version, consider updating
  namespace        = "rabbitmq"
  create_namespace = true

  set {
    name  = "auth.username"
    value = var.rabbitmq_username
    type  = "string"
  }

  set {
    name  = "auth.password"
    value = var.rabbitmq_password
    type  = "string"
  }
}
