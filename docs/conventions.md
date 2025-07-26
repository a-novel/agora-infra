# Convention

This page details the convention to follow for the project.

## OpenTofu

### Naming

To name OpenTofu resources follow the following conventions where applicable:

- `{project_code}-{environment_code}-{resource_name}`
- `{project_code}_{environment_code}_{resource_name}` If usage of `-` is restricted
- `{project_code}{environment_code}{resource_name}` If usage of `-` and `_` is restricted

Environments are defined as following:

| Environment | Short Name | Environment Code | Description                                                   |
| ----------- | ---------- | ---------------- | ------------------------------------------------------------- |
| Root        | root       | r                | For resources shared by all environments                      |
| Playground  | play       | y                | For resource testing purpose only                             |
| Development | dev        | d                | For hosting resources used for the development of the project |
| Quality     | qual       | q                | For hosting resources for quality team                        |
| Staging     | stg        | s                | For hosting of preproduction resources                        |
| Production  | prd        | p                | For hosting of production resources                           |

### Resource tagging

To help resource management, resources must be tagged as following when applicable.

| Tag         | Value                                           | Comment                                                                                    |
| ----------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Environment | Environment short name (ex: `dev`)              | See environment tab above for available values                                             |
| Project     | Name of the project (ex: `qarslv`)              | The project code of the current project                                                    |
| ManagedBy   | For OpenTofu managed resources use `opentofu`   | Tag to specify which tool manages the resource, use `manual` for resource managed manually |
| Name        | The name of the resource (see `Naming` section) | Meaningful name of the resource, useful for display and billing                            |
| RefersTo    | Name of a related resource (ex: `qarslv-d-vpc`) | Tag to help finding the root resource of a sub resource (ex: The EC2 a SG is linked to)    |
