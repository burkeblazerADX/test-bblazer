RMQ Cluster Operator

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| helm | >= 2.10.0 |
| kubernetes | >= 2.21 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 2.10.0 |
| kubernetes | >= 2.21 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.default](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace_v1.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_namespace_v1.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/namespace_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_namespace | Whether to create the namespace or not | `bool` | `true` | no |
| namespace | Kubernetes namespace to deploy into | `string` | `"rabbit"` | no |
| operator\_replica\_count | How many replicas for the operator | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| values\_yaml | The serialised yaml for helm release. |
<!-- END_TF_DOCS -->
