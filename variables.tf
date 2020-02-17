
# Provider Variables
# ---------------------
variable "APIURL" {
  default = "https://192.168.0.55:8006/api2/json"
}
variable "pve_user" {
  default = "root@pam"
}
variable "pass" {
  default = "Bullshiting U"
}


# variables for resources
# ----------------------------------
# (should be the same as in your pve )

variable "hostname" {
default = "terraform-new-container"
}
variable "LxcOsTemplate" {
default = "shared:vztmpl/centos-7-default_20171212_amd64.tar.xz"
}
variable "networkName" {
default = "eth0"
}
variable "poolName" {
default = "terraform"
}
variable "storageName" {
default = "local-lvm"
}
variable "computeNodeName" {
default = "node-01"
}
variable "numCPU" {
  default = "2"
}
variable "machineDescription" {
  default = "terraformed"
}
variable "ram" {
  default = "512"
}
variable "dnsAdress" {
  default = "8.8.8.8"
}
variable "onBootState" {
  default = "false"
}
variable "firewalled" {
  default = "1"
}
variable "unpriviledged" {
  default = "false"
}