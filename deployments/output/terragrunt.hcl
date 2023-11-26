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
download_dir = "${get_repo_root()}/.terragrunt-cache/${path_relative_to_include()}"
