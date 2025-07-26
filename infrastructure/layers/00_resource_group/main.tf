resource "aws_resourcegroups_group" "all" {
  name        = local.rg_name
  description = "Resource group of ${var.environment} environment for project ${var.app_name}"

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = ["AWS::AllSupported"],
      TagFilters = [
        {
          Key    = "Environment",
          Values = [var.environment]
        },
        {
          Key    = "Project",
          Values = [var.app_name]
        }
      ]
    })
  }

  tags = { Name = local.rg_name }
}
