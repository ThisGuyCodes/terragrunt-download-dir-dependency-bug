remote_state {
  backend = "local"
  config = {
    path = "${get_repo_root()}/states/${replace(path_relative_to_include(), "/", "-")}.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

download_dir = "${get_repo_root()}/.terragrunt-cache/${path_relative_to_include()}"
