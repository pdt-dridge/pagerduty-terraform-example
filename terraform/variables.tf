/* 
  Terraform Variables Definition
*/

/* 
  PagerDuty REST API Token
  This should be passed through the command line or as an environment variable; DO NOT check this into the repo!
  
  For example:
  $ terraform apply -var="PAGERDUTY_TOKEN=TOKEN_HERE"
  
  - or -
  
  $ export TF_VAR_PAGERDUTY_TOKEN=TOKEN_HERE
  $ terraform apply
*/
variable "PAGERDUTY_TOKEN" {
  type    = string
}

/*
  PagerDuty Subdomain
*/
variable "PAGERDUTY_DOMAIN" {
  type    = string
}

/*
  Nameset Input - see namesets.tf for implementation
  
  Example usage (eCommerce Nameset): 
  $ terraform apply ... -var="NAMESET=ecommerce"
*/

variable "NAMESET" {
  type    = string
  default = "generic"
}

/*
  POST Webhook URLs (example can be generated from https://webhook.site/)
*/
variable "webhook_restart" {
  type    = string
  default = "https://generic_webhook_url/XXXXXX/BBBBBB"
}

variable "webhook_rollback" {
  type    = string
  default = "https://generic_webhook_url/XXXXXX/BBBBBB"
}

variable "webhook_collect_diagnostics" {
  type    = string
  default = "https://generic_webhook_url/XXXXXX/BBBBBB"
}