# Load Test Codefresh Account Management APIs

export TF_VAR_codefresh_token=$CODEFRESH_TOKEN
export TF_VAR_codefresh_host=$CODEFRESH_HOST

terraform plan -out tfplan
terraform apply tfplan

You know the drill.
