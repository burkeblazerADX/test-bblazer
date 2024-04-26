New feature again

## Testing

### Perf testing
Get username and password from k8s secret
Run perf-test container using username and password
```
INSTANCE=rabbitmq-cluster
NAMESPACE=rabbit
username=$(kubectl get secret ${INSTANCE}-default-user -n ${NAMESPACE} -o jsonpath="{.data.username}" | base64 --decode)
password=$(kubectl get secret ${INSTANCE}-default-user -n ${NAMESPACE} -o jsonpath="{.data.password}" | base64 --decode)
service=${INSTANCE}
kubectl run perf-test --image=pivotalrabbitmq/perf-test -- --uri "amqp://${username}:${password}@${service}"
```

### Test web ui
Port forward the UI
```
INSTANCE=rabbitmq-cluster
NAMESPACE=rabbit
kubectl port-forward svc/${INSTANCE} -n ${NAMESPACE} 15672
```

Get username and password from k8s secret
```
INSTANCE=rabbitmq-cluster
NAMESPACE=rabbit
username=$(kubectl get secret ${INSTANCE}-default-user -n ${NAMESPACE} -o jsonpath="{.data.username}" | base64 --decode)
password=$(kubectl get secret ${INSTANCE}-default-user -n ${NAMESPACE} -o jsonpath="{.data.password}" | base64 --decode)
```

Open browser to http://localhost:15672
Log in with username and password from above

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| kubernetes | >= 2.21 |

## Providers

| Name | Version |
|------|---------|
| kubernetes | >= 2.21 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.deployment_manifest](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace_v1.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_namespace_v1.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/namespace_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_replica\_count | How many replicas for the cluster | `number` | `1` | no |
| create\_namespace | Whether to create the namespace or not | `bool` | `true` | no |
| namespace | Kubernetes namespace to deploy into | `string` | `"rabbit"` | no |
| rabbit\_image\_name | The desired rabbitmq image name | `string` | `"rabbitmq:3.11.3"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
