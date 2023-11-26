variable "input" {
  type     = string
  nullable = false
}

output "output" {
  value = var.input
}
