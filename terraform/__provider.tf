provider "codefresh" {
  api_url = "https://${var.codefresh_host}/api"
  token   = var.codefresh_token
}

data "codefresh_idps" "local" {
  display_name = "local"
}

terraform {
  required_version = ">=0.12.24"
}
