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
| [tama_model.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/model) | resource |
| [tama_source.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/source) | resource |
| [tama_source_limit.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/source_limit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | API key for the model | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Endpoint for the model | `string` | n/a | yes |
| <a name="input_models"></a> [models](#input\_models) | List of models with their identifiers and paths | <pre>list(object({<br>    identifier = string<br>    path       = string<br>    parameters = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the model | `string` | n/a | yes |
| <a name="input_requests_per_second"></a> [requests\_per\_second](#input\_requests\_per\_second) | Requests per second limit | `number` | `10` | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | Space ID for the model | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_model_ids"></a> [model\_ids](#output\_model\_ids) | Map of model identifiers to their IDs |
| <a name="output_source_id"></a> [source\_id](#output\_source\_id) | ID of the source |
<!-- END_TF_DOCS -->