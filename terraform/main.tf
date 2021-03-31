resource "codefresh_account" "account" {

  count = 50

  name     = "load_test_account_x_${count.index}"
  features = var.default_account_features

  limits {
    collaborators        = 1000
    data_retention_weeks = 0
  }

  build {
    parallel = 0
  }

}

resource "codefresh_user" "load-test-user" {

  count = 50

  user_name = "load-test-user-x_${count.index}"
  email     = "load-test-user-${count.index}@test.anz.codefresh.io"

  accounts = codefresh_account.account[*].id

  activate = true

  roles = [
    "User"
  ]

  login {
    idp_id = data.codefresh_idps.local.id
    sso    = false
  }

  personal {
    first_name = "load-test-user-${count.index}"
    last_name  = "test"
  }

  lifecycle {
    ignore_changes = [
      short_profile,
    ]
  }

}
