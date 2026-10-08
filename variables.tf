variable "yourname" {
  description = "Your name, used to make resource names unique."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus"
}

variable "admin_password" {
  description = "Local admin password for the VM."
  type        = string
  sensitive   = true
}

variable "dsrm_password" {
  description = "Directory Services Restore Mode password."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Fully qualified domain name."
  type        = string
  default     = "corp.example.com"
}

variable "domain_netbios" {
  description = "NetBIOS name for the domain."
  type        = string
  default     = "CORP"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)

  default = {
    project = "ad-lab"
  }
}
