include "root" {
  path   = find_in_parent_folders("common.hcl")
  expose = true
}

terraform {
  source = "../../modules/output"
}


inputs = {
  input = "outputs"
}
