variable "name" {
  description = "Name of the Container App Environment."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to deploy into."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the environment."
  type        = map(string)
  default     = {}
}

variable "logs_destination" {
  type = string
  default = "log-analytics"
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "workload_profile" {
  type = object({
    name = string
    workload_profile_type = string
  })
  default = {
    name = "Consumption"
    workload_profile_type = "Consumption"
  }
}
