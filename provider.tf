
provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url = var.APIURL
  pm_password = var.pass
  pm_user = var.pve_user
  #pm_otp = ""
}