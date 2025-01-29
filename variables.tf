# The variable "image" is declared in Producer Portal

variable "source_image" {
  description = "Defines the VM image passed from the GCP Marketplace"
  type        = string
  # Set the default value to your image. Marketplace will overwrite this value
  # to a Marketplace owned image on publishing the product
  default = "projects/graphdb-public/global/images/ontotext-graphdb-10-8-3-202501281446"
}

variable "goog_cm_deployment_name" {
  description = "Deployment name"
  type        = string
  default     = "graphdb"
}

variable "project_id" {
  description = "Project in which the VM will be created"
  type        = string
}

variable "zone" {
  description = "The zone where the VM will be created"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Type of the VM that will be created"
  type        = string
  default     = "n2-highmem-8"
}

variable "boot_disk_size" {
  description = "Boot disk size in GBs"
  type        = number
  default     = 500
}

variable "boot_disk_type" {
  description = "Type of the boot disk"
  type        = string
  default     = "pd-ssd"
}

variable "network_interface" {
  description = "The network interface to attach the VM to"
  type        = string
  default     = "default"
}

variable "allowed_ingress_cidrs" {
  description = "CIDR blocks that are allowed to access the GraphDB port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
