terraform {
  required_version = ">= 1.5.7"
}

module "rabbitmq_cluster_operator" {
  source = "git:https://github.com/telus-agcg/tpm-demeter-terraform-modules.git//modules/rabbitmq-cluster-operator?ref=[REPLACE_ME_WITH_TAG]"
}
