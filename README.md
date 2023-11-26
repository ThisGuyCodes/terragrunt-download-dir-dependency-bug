# download_dir bug with dependencies

This repo is a minimum viable demonstration of a bug with [Terragrunt](https://terragrunt.gruntwork.io/) where if the `download_dir` parameter dependency is set, an empty `.terragrunt-cache` directory is created at the default location anyway.

When Terragrunt runs `terraform init` on a module, it does so after copying source files into a `.terragrunt-cache` directory in the working directory where the Terragrunt command is being run from. However this directory is configurable via an environment variable, [CLI arg](https://terragrunt.gruntwork.io/docs/reference/cli-options/#terragrunt-download-dir), or [parameter in the Terragrunt config](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#download_dir).

Likewise, Terragrunt allows for [dependencies](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency) between modules, and in order to pull in values (e.g. outputs) from said dependencies, it runs `terraform init` in a similar fashion on the dependency. The bug here is that when doing the `terraform init` on a dependency where the `download_dir` config parameter *for the dependency* is set, an empty `.terragrunt-cache` directory is created at the default location anyway.

This can be demonstrated in this repo quite simply:
- `terragrunt apply` on `./deployments/output` correctly creates a cache directory at the root.
- `terragrunt apply` on `./deployments/has_dependency` likewise correctly creates a cache directory at the root, but *also* creates an empty `.terragrunt-cache` directory in `./deployments/output`
