# GraphDB deployment package on GCP

## Quickstart

```shell
terraform init
terraform apply
```

Additionally, to specify custom values for the variables, you can use a `.tfvars` file, or specify individual
variables on the command line, e.g. `-var project_id=<test-project>`.

## Metadata

To update and validate the [metadata.yaml](metadata.yaml) and [metadata.display.yaml](metadata.display.yaml) you can use Google's CFT
tool https://pkg.go.dev/github.com/GoogleCloudPlatform/cloud-foundation-toolkit/cli/bpmetadata

Run the following command in the project directory to regenerate the metadata:

```bash
cft blueprint metadata -d -p .
```

Or simply to validate:

```bash
cft blueprint metadata -v -p .
```

## Resources

- Examples for configuring Blueprint metadata
  - https://github.com/GoogleCloudPlatform/marketplace-tools/blob/master/examples/terraform/wordpress/metadata.display.yaml
  - https://github.com/g-awmalik/terraform-google-canonical-mp/blob/main/metadata.display.yaml
- Blueprint reference https://pkg.go.dev/github.com/GoogleCloudPlatform/cloud-foundation-toolkit/cli/bpmetadata
