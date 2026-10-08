# Azure Active Directory Domain Controller Lab (Terraform)

Infrastructure as Code project that deploys a Windows Server Active Directory
domain controller on Microsoft Azure using Terraform.

## What this project does
- Provisions a Windows Server VM in Azure with Terraform (AzureRM provider v3.117.1)
- Installs Active Directory Domain Services and promotes the VM to a domain controller
- Restricts RDP (port 3389) in the network security group to a single public IP (/32) instead of open access
- Outputs the admin username, domain name, and public IP after deployment
- Tears down fully with `terraform destroy` to control cost

## Tools
Terraform, Azure, Azure CLI, Windows Server, Active Directory, PowerShell, Git/GitHub

## How to run
```powershell
az login
terraform init
terraform validate
terraform plan -out tfplan
terraform apply tfplan
terraform destroy
```
Set the admin password and your public IP through variables or an untracked
`.tfvars` file.

## Verification
After deployment I connected over RDP and confirmed Active Directory was
running on the VM. 

## Issues I troubleshot
| Problem | Resolution |
|---|---|
| Terraform not recognized in a new PowerShell session | Added the Terraform folder to the user PATH |
| Duplicate `tags` variable caused a validation error | Removed the duplicate declaration in `variables.tf` |
| `SkuNotAvailable` for Standard_D2s_v3 in westus | Checked available sizes with `az vm list-skus` and moved to Standard_D2s_v6 |
| `BadRequest`: VM size cannot boot Hypervisor Generation 1 | Switched the image SKU to a Gen2 image |
| Open RDP rule (`*`) | Limited the source to my public IP with /32 |

## Security notes
- `.gitignore` excludes `.terraform/`, state files, `.tfvars`, and plan files
- RDP is limited to one IP address
- Resources were destroyed after testing
