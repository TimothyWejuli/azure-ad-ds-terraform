output "public_ip" {
  description = "Public IP address for RDP."
  value       = azurerm_public_ip.main.ip_address
}

output "domain_name" {
  description = "Active Directory domain name."
  value       = var.domain_name
}

output "admin_username" {
  description = "Admin username."
  value       = "adadmin"
}