resource "helm_release" "newrelic_bundle" {
  count = var.enable_newrelic ? 1 : 0

  name             = "newrelic-bundle"
  repository       = "https://helm-charts.newrelic.com"
  chart            = "nri-bundle"
  version          = "5.0.32" # Example version, consider updating
  namespace        = "newrelic"
  create_namespace = true

  set {
    name  = "global.licenseKey"
    value = var.newrelic_license_key
    type  = "string"
  }

  set {
    name  = "global.cluster"
    value = var.cluster_name
    type  = "string"
  }

  set {
    name  = "newrelic-infrastructure.enabled"
    value = "true"
  }

  set {
    name  = "prometheus-agent.enabled"
    value = "true"
  }
}
