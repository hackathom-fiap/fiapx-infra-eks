# Instala o Helm chart do New Relic para monitoramento do cluster, se habilitado.
resource "helm_release" "newrelic" {
  count = var.enable_newrelic ? 1 : 0

  name             = "newrelic-bundle"
  repository       = "https://helm-charts.newrelic.com"
  chart            = "nri-bundle"
  namespace        = "newrelic"
  create_namespace = true
  version          = "5.0.38" # Versão fixada para garantir estabilidade

  set = [
    {
      name  = "global.licenseKey"
      value = var.newrelic_license_key
    },
    {
      name  = "global.cluster"
      value = var.cluster_name
    },
    {
      name  = "newrelic-infrastructure.enabled"
      value = "true"
    },
    {
      name  = "prometheus-agent.enabled"
      value = "true"
    },
    {
      name  = "kube-state-metrics.enabled"
      value = "true"
    },
    {
      name  = "newrelic-logging.enabled"
      value = "true"
    }
  ]
}
