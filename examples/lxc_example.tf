
resource "proxmox_lxc" "lxc-test" {
    features {
        nesting = true
    }
    hostname = "terraform-new-container"
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
        ip6 = "dhcp"
    }
    ostemplate = "shared:vztmpl/centos-7-default_20171212_amd64.tar.xz"
    password = "rootroot"
    pool = "terraform"
    storage = "local-lvm"
    target_node = "node-01"
    unprivileged = true
}
