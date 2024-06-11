include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/modules/echo"
}

dependency "vpc" {
  config_path = "../foo-vpc"
}

inputs = {
  echo = dependency.vpc.outputs.echo
}
