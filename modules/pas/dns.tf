resource "azurerm_dns_a_record" "apps" {
  name                = "*.apps.${var.env_name}"
  zone_name           = "${var.dns_zone_name}"
  resource_group_name = "${var.resource_group_name}"
  ttl                 = "60"
  records             = ["${azurerm_public_ip.web-lb-public-ip.ip_address}"]
}

resource "azurerm_dns_a_record" "sys" {
  name                = "*.sys.${var.env_name}"
  zone_name           = "${var.dns_zone_name}"
  resource_group_name = "${var.resource_group_name}"
  ttl                 = "60"
  records             = ["${azurerm_public_ip.web-lb-public-ip.ip_address}"]
}

resource "azurerm_dns_a_record" "ssh" {
  name                = "ssh.sys.${var.env_name}"
  zone_name           = "${var.dns_zone_name}"
  resource_group_name = "${var.resource_group_name}"
  ttl                 = "60"
  records             = ["${azurerm_public_ip.diego-ssh-lb-public-ip.ip_address}"]
}

resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql.${var.env_name}"
  zone_name           = "${var.dns_zone_name}"
  resource_group_name = "${var.resource_group_name}"
  ttl                 = "60"
  records             = ["${azurerm_lb.mysql.frontend_ip_configuration.0.private_ip_address}"]
}

resource "azurerm_dns_a_record" "tcp" {
  name                = "tcp.${var.env_name}"
  zone_name           = "${var.dns_zone_name}"
  resource_group_name = "${var.resource_group_name}"
  ttl                 = "60"
  records             = ["${azurerm_public_ip.tcp-lb-public-ip.ip_address}"]
}
