variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used by provisioners"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable vm_count {
  description = "Number of VM for cluster"
  default     = "1"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable source_ip {
  description = "Source IP for firewall SSH rule"
}

variable env {
  description = "Environment type"
  default     = "stage"
}

variable deploy_app {
  description = "True for deploy reddit-app and false for not"
  default     = true
}
