data "aws_iam_policy_document" "external_secrets_policy" {
  count = var.enable_external_secrets ? 1 : 0

  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "external_secrets_policy" {
  count = var.enable_external_secrets ? 1 : 0

  name_prefix = "external-secrets-policy"
  policy      = data.aws_iam_policy_document.external_secrets_policy[0].json
}

module "external_secrets_iam_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  count  = var.enable_external_secrets ? 1 : 0

  role_name_prefix      = "external-secrets"
  attach_external_secrets_policy = true

  external_secrets_secret_store_arns = ["*"]

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-secrets"]
    }
  }
}

resource "helm_release" "external_secrets" {
  count = var.enable_external_secrets ? 1 : 0

  name       = "external-secrets"
  namespace  = "kube-system"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = "0.9.13"

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.external_secrets_iam_role[0].iam_role_arn
  }
}
