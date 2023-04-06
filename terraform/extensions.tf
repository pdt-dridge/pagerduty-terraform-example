/* 
  PagerDuty Service Extensions
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/extension.html
  
  NB: You can only define 1 entry for "extension_objects" per extension
  i.e. multiple extensions for the same service requires multiple "pagerduty_extension" stanzas
*/

/* 
  List of services with common extensions
*/

locals {
  technical_service_ids = [
    pagerduty_service.tech_service_1a.id,
    pagerduty_service.tech_service_1b.id,
    pagerduty_service.tech_service_1c.id,
    pagerduty_service.tech_service_2a.id,
    pagerduty_service.tech_service_2b.id,
    pagerduty_service.tech_service_3.id,
    pagerduty_service.tech_service_4.id,
    pagerduty_service.tech_service_5.id,
  ]
}

/* 
  Extensions
*/
resource "pagerduty_extension" "collect_diagnostics_extensions" {
  count               = length(local.technical_service_ids)
  name                = "Collect Diagnostics"
  endpoint_url        = var.webhook_collect_diagnostics
  extension_schema    = data.pagerduty_extension_schema.custom_incident_action.id
  extension_objects   = [local.technical_service_ids[count.index]]
}

resource "pagerduty_extension" "restart_extensions" {
  count               = length(local.technical_service_ids)
  name                = "Restart Service"
  endpoint_url        = var.webhook_restart
  extension_schema    = data.pagerduty_extension_schema.custom_incident_action.id
  extension_objects   = [local.technical_service_ids[count.index]]
}

resource "pagerduty_extension" "rollback_extensions" {
  count               = length(local.technical_service_ids)
  name                = "Rollback Previous Deploy"
  endpoint_url        = var.webhook_rollback
  extension_schema    = data.pagerduty_extension_schema.custom_incident_action.id
  extension_objects   = [local.technical_service_ids[count.index]]
}