<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tama"></a> [tama](#requirement\_tama) | ~> 0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tama"></a> [tama](#provider\_tama) | ~> 0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tama_source_identity.manage](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/source_identity) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |
| [tama_specification.manage](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/specification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | The API key for authentication | `any` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The endpoint of the Elasticsearch server | `any` | n/a | yes |
| <a name="input_identity_identifier"></a> [identity\_identifier](#input\_identity\_identifier) | The identifier for the identity | `string` | `"ApiKey"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elasticsearch space | `string` | `"elasticsearch"` | no |
| <a name="input_schema_version"></a> [schema\_version](#input\_schema\_version) | Schema version for the model | `string` | n/a | yes |
| <a name="input_validation"></a> [validation](#input\_validation) | Used to verify that the API key is valid | <pre>object({<br>    path   = string,<br>    method = string,<br>    codes  = list(number)<br>  })</pre> | <pre>{<br>  "codes": [<br>    200<br>  ],<br>  "method": "GET",<br>  "path": "/_cluster/health"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_query_schema"></a> [query\_schema](#output\_query\_schema) | The query schema for elasticsearch. |
| <a name="output_space_id"></a> [space\_id](#output\_space\_id) | The space id of elasticsearch space |
| <a name="output_specification_id"></a> [specification\_id](#output\_specification\_id) | The specification id of elasticsearch specification |
<!-- END_TF_DOCS -->
