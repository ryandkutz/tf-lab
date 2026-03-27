include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

dependency "cae" {
  config_path = "../container-app-environment"
  mock_outputs = {
    id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.OperationalInsights/workspaces/workspaceName"
  }
}

inputs = {
  name                         = values.name
  resource_group_name          = values.resource_group_name
  container_app_environment_id = dependency.cae.outputs.id
  container_image              = values.container_image
  container_name               = try(values.container_name, "app")
  cpu                          = try(values.cpu, 0.25)
  memory                       = try(values.memory, "0.5Gi")
  revision_mode                = try(values.revision_mode, "Single")
  tags                         = merge(include.root.locals.default_tags, try(values.tags, {}))
}
