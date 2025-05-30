# GraphDB deployment package on GCP

This terraform module allows you to deploy GraphDB instance in Google Compute Engine.

## Table of contents

- [About GraphDB](#about-graphdb)
- [Features](#features)
- [Versioning](#versioning)
- [Prerequisites](#prerequisites)
- [Inputs](#inputs)
- [Quick Start](#quickstart)
- [Metadata](#metadata)
- [Resources](#resources)
- [Local Development](#local-development)
- [Release History](#release-history)
- [Contributing](#contributing)
- [License](#license)

## About GraphDB

<p align="center">
  <a href="https://www.ontotext.com/products/graphdb/">
    <picture>
      <img src="https://www.ontotext.com/wp-content/uploads/2022/09/Logo-GraphDB.svg" alt="GraphDB logo" title="GraphDB"
      height="75">
    </picture>
  </a>
</p>

Ontotext GraphDB is a highly efficient, scalable and robust graph database with RDF and SPARQL support. With excellent
enterprise features,
integration with external search applications, compatibility with industry standards, and both community and commercial
support, GraphDB is the
preferred database choice of both small independent developers and big enterprises.

## Features

The module provides the building blocks of configuring, deploying and provisioning a single VM of GraphDB
using Google Compute Engine. Key features of the module include:

- Google Cloud Compute Engine Instance

## Versioning

The Terraform module follows the Semantic Versioning 2.0.0 rules and has a release lifecycle separate from the GraphDB
versions. The next table shows the version compatability between GraphDB, and the Terraform module.

| GraphDB Terraform                                                              | GraphDB                                                                              |
|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| [Version 0.1.x](https://github.com/Ontotext-AD/terraform-gcp-graphdb/releases)  | [Version 10.7.x](https://graphdb.ontotext.com/documentation/10.7/release-notes.html) |
| [Version 0.2.x](https://github.com/Ontotext-AD/terraform-gcp-graphdb/releases) | [Version 10.8.x](https://graphdb.ontotext.com/documentation/10.8/release-notes.html) |
You can track the particular version updates of GraphDB in the [changelog](CHANGELOG.md).

## Prerequisites

Before you begin using this Terraform module, ensure you meet the following prerequisites:

- **Google Cloud CLI**:
  [Google Cloud CLI](https://cloud.google.com/sdk/docs/install)

- **Terraform Installed**: You should have Terraform installed on your local machine. You can download Terraform from
  the [https://developer.hashicorp.com/terraform/install?product_intent=terraform](Terraform website).

- **Google Cloud Credentials**: Ensure that you have Google Cloud credentials configured on your machine. You can configure Google Cloud access
  keys and secret keys using the [Google Cloud CLI](https://cloud.google.com/docs/authentication/gcloud).

- **Terraform Google Cloud Provider Configuration**: Configure the Google Cloud provider in your Terraform project. You can add your Google Cloud
  access and secret keys as environment variables or use other methods for provider configuration.

<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| source\_image | Defines the VM image passed from the GCP Marketplace | `string` | `"projects/graphdb-public/global/images/ontotext-graphdb-10-8-7-202505280754"` | no |
| goog\_cm\_deployment\_name | Deployment name | `string` | `"graphdb"` | no |
| project\_id | Project in which the VM will be created | `string` | n/a | yes |
| zone | The zone where the VM will be created | `string` | `"us-central1-a"` | no |
| machine\_type | Type of the VM that will be created | `string` | `"n2-highmem-8"` | no |
| boot\_disk\_size | Boot disk size in GBs | `number` | `500` | no |
| boot\_disk\_type | Type of the boot disk | `string` | `"pd-ssd"` | no |
| network\_interface | The network interface to attach the VM to | `string` | `"default"` | no |
| allowed\_ingress\_cidrs | CIDR blocks that are allowed to access the GraphDB port | `list(string)` | ```[ "0.0.0.0/0" ]``` | no |
<!-- END_TF_DOCS -->

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

## Local Development

Instead of using the module dependency, you can create a local variables file named `terraform.tfvars` and provide
configuration overrides there.
Here's an example of a `terraform.tfvars` file:

```hcl

project_id = "example-project-id"

zone = "us-central1-a"

machine_type = "n2-highmem-8"

boot_disk_size = "500"

boot_disk_type = "pd-ssd"

allowed_ingress_cidrs = ["0.0.0.0/0"]

```

## Release History

All notable changes between version are tracked and documented at [CHANGELOG.md](CHANGELOG.md).

## Contributing

Check out the contributors guide [CONTRIBUTING.md](CONTRIBUTING.md).

## License

This code is released under the Apache 2.0 License. See [LICENSE](LICENSE) for more details.
