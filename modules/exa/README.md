# Exa Module

Creates a dedicated Tama component space for Exa Search and exposes the generated
`specification_id` for use by tooling or other modules.

## Usage

```hcl
module "exa" {
  source = "../../modules/exa"

  api_key = var.exa_api_key
}
```

## Output

- `space_id`: The Exa component space ID.
- `specification_id`: The Exa specification ID to pass into downstream modules.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tama"></a> [tama](#requirement\_tama) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tama"></a> [tama](#provider\_tama) | ~> 0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tama_source_identity.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/source_identity) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |
| [tama_specification.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/specification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | The API key for Exa | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The Exa API endpoint | `string` | `"https://api.exa.ai"` | no |
| <a name="input_identity_identifier"></a> [identity\_identifier](#input\_identity\_identifier) | The security scheme identifier used by the specification | `string` | `"ApiKey"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Exa space | `string` | `"exa"` | no |
| <a name="input_schema_version"></a> [schema\_version](#input\_schema\_version) | Schema version for the Exa specification | `string` | `"1.0.0"` | no |
| <a name="input_validation"></a> [validation](#input\_validation) | Validation request used to verify that the API key is accepted by Exa | <pre>object({<br/>    path   = string,<br/>    method = string,<br/>    codes  = list(number)<br/>  })</pre> | <pre>{<br/>  "codes": [<br/>    400,<br/>    422<br/>  ],<br/>  "method": "POST",<br/>  "path": "/search"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_space_id"></a> [space\_id](#output\_space\_id) | The space id of the Exa space |
| <a name="output_specification_id"></a> [specification\_id](#output\_specification\_id) | The specification id of the Exa specification |
<!-- END_TF_DOCS -->
