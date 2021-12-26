provider "netlify" {
  token = "${var.netlify_token}"
}

resource "netlify_deploy_key" "key" {}

resource "netlify_site" netlify_site {
  name = "${var.app_name}"
  custom_domain = "${var.site_name}"

  repo {
    command = "yarn scutage"
    deploy_key_id = "${netlify_deploy_key.key.id}"
    dir = "dist"
    provider = "github"
    repo_path = "ajcrites/color-tool"
    repo_branch = "master"
  }
}

terraform {
  backend "s3" {}
}
