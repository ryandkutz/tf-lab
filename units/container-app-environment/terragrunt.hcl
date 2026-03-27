include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

dependency "law" {
  config_path = "../log-analytics-workspace"

 mock_outputs = {
   id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.OperationalInsights/workspaces/workspaceName"
 }
}

inputs = {
  name                       = values.name
  resource_group_name        = values.resource_group_name
  location                   = values.location
  log_analytics_workspace_id = dependency.law.outputs.id
  tags                       = merge(include.root.locals.default_tags, try(values.tags, {}))
}
