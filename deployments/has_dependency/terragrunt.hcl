include "root" {
  path   = find_in_parent_folders("common.hcl")
  expose = true
}

dependency "dep" {
  config_path = "../output"
}

terraform {
  source = "../../modules/output"
}

inputs = {
  input = "more ${dependency.dep.outputs.output}"
}
