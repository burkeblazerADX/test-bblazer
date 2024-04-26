variable "namespace" {
  description = "Kubernetes namespace to deploy into"
  type        = string
  default     = "rabbit"
}

variable "create_namespace" {
  description = "Whether to create the namespace or not"
  type        = bool
  default     = true
}

variable "operator_replica_count" {
  description = "How many replicas for the operator"
  type        = number
  default     = 1
}
