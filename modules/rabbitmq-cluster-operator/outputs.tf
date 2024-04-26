output "values_yaml" {
  description = "The serialised yaml for helm release."
  value       = helm_release.default.values
}
