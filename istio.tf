resource "kubernetes_namespace" "istio_system" {
  count = var.enable_istio ? 1 : 0

  metadata {
    name = "istio-system"
  }
}

resource "helm_release" "istio_base" {
  count = var.enable_istio ? 1 : 0

  name       = "istio-base"
  namespace  = kubernetes_namespace.istio_system[0].metadata[0].name
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  version    = "1.21.0"
}

resource "helm_release" "istiod" {
  count = var.enable_istio ? 1 : 0

  name       = "istiod"
  namespace  = kubernetes_namespace.istio_system[0].metadata[0].name
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  version    = "1.21.0"
  depends_on = [helm_release.istio_base]
}

resource "kubernetes_namespace" "istio_ingress" {
  count = var.enable_istio ? 1 : 0

  metadata {
    name = "istio-ingress"
  }
}

resource "helm_release" "istio_ingress" {
  count = var.enable_istio ? 1 : 0

  name       = "istio-ingress"
  namespace  = kubernetes_namespace.istio_ingress[0].metadata[0].name
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"
  version    = "1.21.0"
  depends_on = [helm_release.istiod]
}
