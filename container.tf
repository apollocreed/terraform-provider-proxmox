
resource "proxmox_lxc" "lxc-test" {
  features {
    nesting = true
  }

  network {
    name = var.networkName
    bridge = "vmbr0"
    firewall = var.firewalled
    ip = "dhcp"
    ip6 = "dhcp"
  }
  onboot = var.onBootState
  nameserver = var.dnsAdress

  hostname = var.hostname
  ostemplate = var.LxcOsTemplate
  password = "rootroot"
  memory = var.ram
  description = var.machineDescription
  # a pool have to be present in Proxmox
  pool = var.poolName
  storage = var.storageName
  target_node = var.computeNodeName
  unprivileged = var.unpriviledged
  # number of cores
  cores = var.numCPU
}