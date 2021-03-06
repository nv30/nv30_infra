variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the private key used by provisioners"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable machine_type {
  description = "Machine type for reddit app instance"
  default     = "g1-small"
}

variable env {
  description = "Environment type"
  default     = ""
}

variable database_ip {
  description = "Internal IP of reddit-db instance"
}

variable deploy_app {
  description = "True for deploy reddit-app and false for not"
}
