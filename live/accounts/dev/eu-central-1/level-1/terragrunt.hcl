include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_repo_root()}/modules/echo"
}

dependency "level_0" {
  config_path = "../level-0"
}

inputs = {
  echo = dependency.level_0.outputs.echo
}
