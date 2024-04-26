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

variable "cluster_replica_count" {
  description = "How many replicas for the cluster"
  type        = number
  default     = 1
}

variable "rabbit_image_name" {
  description = "The desired rabbitmq image name"
  type        = string
  default     = "rabbitmq:3.11.3"
}
