# Load Test Codefresh Account Management APIs

Note that the `CODEFRESH_TOKEN` should belong to an user in the `Admin` role, and should have all scopes.

```
export TF_VAR_codefresh_token=$CODEFRESH_TOKEN
export TF_VAR_codefresh_host=$CODEFRESH_HOST
terraform plan -out tfplan
terraform apply tfplan
```

To build a docker image with the codefresh provider:

```
cat << EOF > Dockerfile
ARG TERRAFORM_VERSION

FROM hub.artifactory.gcp.anz/hashicorp/terraform:${TERRAFORM_VERSION}

RUN apk add --update --no-cache curl

ARG TERRAFORM_CODEFRESH_PROVIDER_VERSION

RUN curl -o /tmp/terraform-provider-codefresh.tar.gz \
  https://artifactory.gcp.anz/artifactory/github/codefresh-io/terraform-provider-codefresh/releases/download/${TERRAFORM_CODEFRESH_PROVIDER_VERSION}/terraform-provider-codefresh_${TERRAFORM_CODEFRESH_PROVIDER_VERSION}_Linux_x86_64.tar.gz --fail --silent -SL \
  && mkdir -p /root/.terraform.d/plugins/linux_amd64 \
  && tar -xzf /tmp/terraform-provider-codefresh.tar.gz -C /root/.terraform.d/plugins/linux_amd64 \
  && rm /tmp/terraform-provider-codefresh.tar.gz
EOF

docker build \
  --build-arg=TERRAFORM_VERSION=0.12.29 \
  --build-arg=TERRAFORM_CODEFRESH_PROVIDER_VERSION=0.0.12 . -t terraform-0.12.29-cf-0.0.12
```

Then:

```
docker run -it --rm \
  -v $(pwd):/app \
  -w /app \
  --entrypoint=sh \
  -eTF_VAR_codefresh_token=$CODEFRESH_TOKEN \
  -eTF_VAR_codefresh_host=$CODEFRESH_HOST \
  terraform-0.12.29-cf-0.0.12
```
