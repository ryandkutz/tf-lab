resource "azurerm_container_app_environment" "this" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  logs_destination = var.logs_destination
  log_analytics_workspace_id = var.log_analytics_workspace_id
  workload_profile {
    name = var.workload_profile.name
    workload_profile_type = var.workload_profile.workload_profile_type
  }
  tags                       = var.tags
}
